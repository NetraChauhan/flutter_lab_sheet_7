import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q09.db');List<Student> list=[];
  @override void initState(){super.initState();load();}
  Future<void> load()async{await db.seed();list=await db.read();if(mounted)setState((){});}
  @override Widget build(c)=>LabPage(title:'Delete Student',subtitle:'Tap delete to remove a record',child:Column(children:list.map((s)=>
    StudentTile(s,trailing:IconButton(icon:const Icon(Icons.delete_outline),onPressed:()async{
      await db.delete(s.id!);await load();
    }))).toList()));
}
