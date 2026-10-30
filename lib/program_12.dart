import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'student.dart';
import 'lab_ui.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner:false,
  theme:labTheme(),
  home:const App(),
));

class App extends StatefulWidget{
  const App({super.key});
  State<App> createState()=>_S();
}

class _S extends State<App>{
  final helper=DatabaseHelper('q12.db');
  String course='BCA';
  List<Student> students=[];

  @override
  void initState(){
    super.initState();
    load();
  }

  Future<void> load()async{
    await helper.seed();
    final db=await helper.database;
    final rows=await db.query(
      'students',
      where:'course=?',
      whereArgs:[course],
    );
    students=rows.map(Student.fromMap).toList();
    if(mounted)setState((){});
  }

  @override
  Widget build(BuildContext context)=>LabPage(
    title:'Students by Course',
    subtitle:'Select a course using DropdownButton',
    child:Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children:[
        const Text(
          'Select Course',
          style:TextStyle(fontWeight:FontWeight.w700),
        ),
        const SizedBox(height:8),

        Container(
          width:double.infinity,
          padding:const EdgeInsets.symmetric(horizontal:14),
          decoration:BoxDecoration(
            color:const Color(0xFFF7FEE7),
            borderRadius:BorderRadius.circular(14),
            border:Border.all(color:const Color(0xFFD9F99D)),
          ),
          child:DropdownButton<String>(
            value:course,
            isExpanded:true,
            underline:const SizedBox(),
            items:['BCA','BBA']
              .map((x)=>DropdownMenuItem(value:x,child:Text(x)))
              .toList(),
            onChanged:(value){
              course=value!;
              load();
            },
          ),
        ),

        const SizedBox(height:16),
        Text(
          students.length.toString()+' student(s) in '+course,
          style:const TextStyle(fontWeight:FontWeight.w700),
        ),
        const SizedBox(height:10),
        ...students.map((s)=>StudentTile(s)),
      ],
    ),
  );
}
