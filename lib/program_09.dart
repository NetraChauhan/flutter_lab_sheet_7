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
  final helper=DatabaseHelper('q09.db');
  List<Student> students=[];
  String status='Tap the delete icon to remove a student';

  @override
  void initState(){
    super.initState();
    start();
  }

  Future<void> start()async{
    await helper.seed();   // sample data only once
    await refresh();
  }

  Future<void> refresh()async{
    students=await helper.read();
    if(mounted)setState((){});
  }

  Future<void> remove(Student s)async{
    final db=await helper.database;

    // Required by Q9: delete() method
    final deleted=await db.delete(
      'students',
      where:'id=?',
      whereArgs:[s.id],
    );

    status=deleted>0
      ?s.name+' deleted successfully'
      :'Record not deleted';

    await refresh();
  }

  @override
  Widget build(BuildContext context)=>LabPage(
    title:'Delete Student',
    subtitle:'Delete a student record using delete()',
    child:Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children:[
        Container(
          width:double.infinity,
          padding:const EdgeInsets.all(12),
          margin:const EdgeInsets.only(bottom:14),
          decoration:BoxDecoration(
            color:const Color(0xFFFEF2F2),
            borderRadius:BorderRadius.circular(12),
          ),
          child:Text(
            status,
            style:const TextStyle(
              color:Color(0xFFB91C1C),
              fontWeight:FontWeight.w700,
            ),
          ),
        ),

        if(students.isEmpty)
          const Center(
            child:Padding(
              padding:EdgeInsets.all(24),
              child:Text('No student records left'),
            ),
          ),

        ...students.map((s)=>StudentTile(
          s,
          trailing:IconButton(
            tooltip:'Delete',
            icon:const Icon(
              Icons.delete_outline_rounded,
              color:Color(0xFFB91C1C),
            ),
            onPressed:()=>remove(s),
          ),
        )),
      ],
    ),
  );
}
