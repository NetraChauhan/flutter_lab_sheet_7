import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q08.db');Student? s;bool updated=false;
  @override void initState(){super.initState();load();}
  Future<void> load()async{await db.seed();s=(await db.read()).first;if(mounted)setState((){});}
  @override Widget build(c)=>LabPage(title:'Update Student',subtitle:'Update an existing record',child:Column(children:[
    if(updated)const Padding(padding:EdgeInsets.only(bottom:12),child:Text('✓ Record updated successfully',style:TextStyle(fontWeight:FontWeight.w700,color:Colors.green))),if(s!=null)StudentTile(s!),const SizedBox(height:12),
    FilledButton.icon(onPressed:s==null?null:()async{
      await db.update(s!.copyWith(course:'BCA - Updated'));s=(await db.read()).first;setState(()=>updated=true);
    },icon:const Icon(Icons.edit),label:const Text('Update Course'))
  ]));
}
