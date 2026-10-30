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
  final helper=DatabaseHelper('q06.db');
  List<Student> students=[];

  @override
  void initState(){
    super.initState();
    load();
  }

  Future<void> load()async{
    await helper.seed();
    final db=await helper.database;

    // Required by Q6: read all records using query()
    final rows=await db.query('students');

    students=rows.map(Student.fromMap).toList();
    if(mounted)setState((){});
  }

  @override
  Widget build(BuildContext context)=>LabPage(
    title:'All Students',
    subtitle:'query() method + ListView',
    child:Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children:[
        Container(
          width:double.infinity,
          padding:const EdgeInsets.symmetric(horizontal:14,vertical:12),
          decoration:BoxDecoration(
            color:const Color(0xFFECFDF5),
            borderRadius:BorderRadius.circular(14),
          ),
          child:Row(children:[
            const Icon(Icons.check_circle_rounded,color:Color(0xFF047857)),
            const SizedBox(width:10),
            Text(
              students.length.toString()+' records fetched using query()',
              style:const TextStyle(
                color:Color(0xFF047857),
                fontWeight:FontWeight.w700,
              ),
            ),
          ]),
        ),
        const SizedBox(height:14),

        // Required by Q6: display records using ListView
        SizedBox(
          height:300,
          child:ListView.builder(
            itemCount:students.length,
            itemBuilder:(context,index)=>StudentTile(students[index]),
          ),
        ),
      ],
    ),
  );
}
