import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q06.db');List<Student> list=[];
  @override void initState(){super.initState();load();}
  Future<void> load()async{await db.seed();list=await db.read();if(mounted)setState((){});}
  @override Widget build(c)=>LabPage(title:'All Students',subtitle:'Records fetched using query()',child:Column(
    children:list.map((s)=>StudentTile(s)).toList()));
}
