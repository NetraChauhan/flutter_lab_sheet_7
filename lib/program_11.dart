import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final h=DatabaseHelper('q11.db'),r=TextEditingController(text:'BCA102');Student? found;
  @override void initState(){super.initState();h.seed();}
  Future<void> search()async{
    final db=await h.database;final x=await db.query('students',where:'roll=?',whereArgs:[r.text]);
    setState(()=>found=x.isEmpty?null:Student.fromMap(x.first));
  }
  @override Widget build(c)=>LabPage(title:'Search Student',subtitle:'Search by roll number using WHERE',child:Column(children:[
    field(r,'Roll Number'),SizedBox(width:double.infinity,child:FilledButton(onPressed:search,child:const Text('Search'))),
    const SizedBox(height:16),if(found!=null)StudentTile(found!) else const Text('Enter a roll number to search')
  ]));
}
