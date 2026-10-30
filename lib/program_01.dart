import 'package:flutter/material.dart';
import 'database_helper.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  String msg='Creating SQLite database...';final db=DatabaseHelper('q01.db');
  @override void initState(){super.initState();create();}
  Future<void> create()async{await db.database;if(mounted)setState(()=>msg='Database created successfully');}
  @override Widget build(c)=>LabPage(title:'SQLite Database',subtitle:'Database Creation',child:Card(
    child:Padding(padding:const EdgeInsets.all(28),child:Column(children:[
      const Icon(Icons.storage_rounded,size:54),const SizedBox(height:14),
      Text(msg,style:Theme.of(c).textTheme.titleLarge,textAlign:TextAlign.center),
      const SizedBox(height:8),const Text('students.db • Ready for CRUD operations')
    ]))));
}
