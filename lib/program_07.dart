import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final h=DatabaseHelper('q07.db');List<Student> list=[];
  @override void initState(){super.initState();load();}
  Future<void> load()async{
    await h.seed();final db=await h.database;
    list=(await db.rawQuery('SELECT * FROM students')).map(Student.fromMap).toList();
    if(mounted)setState((){});
  }
  @override Widget build(c)=>LabPage(title:'Student Records',subtitle:'Fetched using rawQuery()',child:Column(
    children:list.map((s)=>StudentTile(s)).toList()));
}
