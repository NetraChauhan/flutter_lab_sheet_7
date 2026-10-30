import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q03.db');Student? s;
  @override Widget build(c)=>LabPage(title:'Insert Student',subtitle:'Using insert() method',child:Column(children:[
    FilledButton.icon(onPressed:()async{
      await db.clear();await db.insert(const Student(name:'Aarav Mehta',roll:'BCA101',course:'BCA'));
      setState(()=>s=(await db.read()).first);
    },icon:const Icon(Icons.person_add),label:const Text('Insert Student')),
    const SizedBox(height:16),if(s!=null)StudentTile(s!)
  ]));
}
