import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final h=DatabaseHelper('q12.db');String course='BCA';List<Student> list=[];
  @override void initState(){super.initState();load();}
  Future<void> load()async{
    await h.seed();final db=await h.database;
    list=(await db.query('students',where:'course=?',whereArgs:[course])).map(Student.fromMap).toList();
    if(mounted)setState((){});
  }
  @override Widget build(c)=>LabPage(title:'Students by Course',subtitle:'Filter records with DropdownButton',child:Column(children:[
    DropdownButtonFormField<String>(value:course,items:['BCA','BBA'].map((x)=>DropdownMenuItem(value:x,child:Text(x))).toList(),
      onChanged:(v){course=v!;load();},decoration:const InputDecoration(labelText:'Course')),
    const SizedBox(height:14),...list.map((s)=>StudentTile(s))
  ]));
}
