import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q15.db');Student? original,retrieved;Map<String,Object?>? map;
  Future<void> run()async{
    await db.clear();
    original=const Student(name:'Rhea Sen',roll:'BCA107',course:'BCA');
    map=original!.toMap();
    await db.insert(original!);
    retrieved=(await db.read()).first;
    setState((){});
  }
  @override Widget build(c)=>LabPage(title:'Student Model',subtitle:'toMap() + fromMap() with SQLite',child:Column(children:[
    FilledButton(onPressed:run,child:const Text('Convert, Insert & Retrieve')),
    const SizedBox(height:16),
    if(original!=null)...[
      const Align(alignment:Alignment.centerLeft,child:Text('1. Student Object',style:TextStyle(fontWeight:FontWeight.w800))),
      StudentTile(original!),
      const Align(alignment:Alignment.centerLeft,child:Text('2. toMap() Output',style:TextStyle(fontWeight:FontWeight.w800))),
      Container(width:double.infinity,padding:const EdgeInsets.all(12),margin:const EdgeInsets.symmetric(vertical:8),
        decoration:BoxDecoration(color:const Color(0xFFFDF2F8),borderRadius:BorderRadius.circular(12)),
        child:Text(map.toString(),style:const TextStyle(fontFamily:'monospace'))),
      const Align(alignment:Alignment.centerLeft,child:Text('3. Retrieved with fromMap()',style:TextStyle(fontWeight:FontWeight.w800))),
      StudentTile(retrieved!)
    ]
  ]));
}
