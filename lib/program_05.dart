import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final h=DatabaseHelper('q05.db');Student? s;
  Future<void> add()async{
    final db=await h.database;await db.delete('students');
    await db.rawInsert('INSERT INTO students(name,roll,course) VALUES(?,?,?)',['Mira Kapoor','BCA102','BCA']);
    final rows=await h.read();
    setState(()=>s=rows.first);
  }
  @override Widget build(c)=>LabPage(title:'Raw Insert',subtitle:'Insert record using rawInsert()',child:Column(children:[
    FilledButton(onPressed:add,child:const Text('Run rawInsert()')),
    const SizedBox(height:16),if(s!=null)StudentTile(s!)
  ]));
}
