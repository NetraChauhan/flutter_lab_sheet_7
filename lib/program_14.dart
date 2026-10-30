import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final h=DatabaseHelper('q14.db');int count=0;
  @override void initState(){super.initState();load();}
  Future<void> load()async{
    await h.seed();final db=await h.database;
    count=Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM students'))??0;
    if(mounted)setState((){});
  }
  @override Widget build(c)=>LabPage(title:'Record Count',subtitle:'Total students in database',child:Card(child:Padding(
    padding:const EdgeInsets.all(30),child:Column(children:[
      Text('$count',style:Theme.of(c).textTheme.displayLarge),const Text('Total Student Records')
    ]))));
}
