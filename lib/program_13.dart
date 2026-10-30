import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q13.db');List<Student> list=[];
  @override void initState(){super.initState();load();}
  Future<void> load()async{await db.seed();list=await db.read(orderBy:'name ASC');if(mounted)setState((){});}
  @override Widget build(c)=>LabPage(title:'Sorted Students',subtitle:'Ascending order of name • orderBy',child:Column(
    children:list.map((s)=>StudentTile(s)).toList()));
}
