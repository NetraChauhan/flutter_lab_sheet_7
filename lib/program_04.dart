import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q04.db'),n=TextEditingController(),r=TextEditingController(),c=TextEditingController();
  Student? saved;
  @override Widget build(x)=>LabPage(title:'Add Student',subtitle:'Enter student details',child:Column(children:[
    field(n,'Name'),field(r,'Roll Number'),field(c,'Course'),
    SizedBox(width:double.infinity,child:FilledButton(onPressed:()async{
      await db.insert(Student(name:n.text,roll:r.text,course:c.text));
      setState(()=>saved=Student(name:n.text,roll:r.text,course:c.text));
    },child:const Text('Save Student'))),
    const SizedBox(height:16),if(saved!=null)StudentTile(saved!)
  ]));
}
