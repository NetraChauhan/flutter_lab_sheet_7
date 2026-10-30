import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final h=DatabaseHelper('q07.db');List<Student> list=[];
  @override void initState(){super.initState();load();}
  Future<void> load()async{
    await h.seed();final db=await h.database;
    list=(await db.rawQuery('SELECT * FROM students')).map(Student.fromMap).toList();
    if(mounted)setState((){});
  }
  @override Widget build(c)=>LabPage(title:'Student Records',subtitle:'Fetched using rawQuery()',child:Column(children:[
    Container(
      width:double.infinity,
      padding:const EdgeInsets.all(12),
      margin:const EdgeInsets.only(bottom:14),
      decoration:BoxDecoration(color:const Color(0xFFF0F9FF),borderRadius:BorderRadius.circular(12)),
      child:const Text("SQL: SELECT * FROM students",style:TextStyle(fontFamily:'monospace',fontWeight:FontWeight.w700)),
    ),
    ...list.map((s)=>StudentTile(s))
  ]));
}
