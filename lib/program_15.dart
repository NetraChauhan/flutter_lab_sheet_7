import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q15.db');List<Student> list=[];
  Future<void> run()async{
    await db.clear();final s=const Student(name:'Rhea Sen',roll:'BCA107',course:'BCA');
    await db.insert(s);list=await db.read();setState((){});
  }
  @override Widget build(c)=>LabPage(title:'Student Model',subtitle:'toMap() + fromMap() with SQLite',child:Column(children:[
    FilledButton(onPressed:run,child:const Text('Insert & Retrieve Student')),
    const SizedBox(height:16),...list.map((s)=>StudentTile(s))
  ]));
}
