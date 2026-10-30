import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q10.db');List<Student> list=[];
  @override void initState(){super.initState();load();}
  Future<void> load()async{await db.seed();list=await db.read();if(mounted)setState((){});}
  @override Widget build(c)=>LabPage(title:'Clear Students',subtitle:'Delete all records',child:Column(children:[
    Align(alignment:Alignment.centerRight,child:FilledButton.tonalIcon(onPressed:()async{
      await db.clear();setState(()=>list=[]);
    },icon:const Icon(Icons.delete_sweep),label:const Text('Clear All'))),
    const SizedBox(height:12),
    if(list.isEmpty)const Card(child:ListTile(title:Text('No student records'))),
    ...list.map((s)=>StudentTile(s))
  ]));
}
