import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q16.db');List<Student> list=[];
  @override void initState(){super.initState();refresh();}
  Future<void> refresh()async{await db.seed();list=await db.read();if(mounted)setState((){});}
  @override Widget build(c)=>LabPage(title:'DatabaseHelper CRUD',subtitle:'Open • Insert • Read • Update • Delete',child:Column(children:[
    Wrap(spacing:8,runSpacing:8,children:[
      FilledButton(onPressed:()async{await db.insert(const Student(name:'Tara Roy',roll:'BCA110',course:'BCA'));await refresh();},child:const Text('Insert')),
      FilledButton.tonal(onPressed:list.isEmpty?null:()async{await db.update(list.first.copyWith(course:'MCA'));await refresh();},child:const Text('Update First')),
      OutlinedButton(onPressed:list.isEmpty?null:()async{await db.delete(list.last.id!);await refresh();},child:const Text('Delete Last'))
    ]),
    const SizedBox(height:14),...list.map((s)=>StudentTile(s))
  ]));
}
