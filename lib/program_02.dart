import 'package:flutter/material.dart';
import 'database_helper.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q02.db');bool ready=false;
  @override void initState(){super.initState();make();}
  Future<void> make()async{await db.database;if(mounted)setState(()=>ready=true);}
  @override Widget build(c)=>LabPage(title:'Students Table',subtitle:'Table Structure',child:Card(
    child:Padding(padding:const EdgeInsets.all(22),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Text(ready?'students table created':'Creating table...',style:Theme.of(c).textTheme.titleLarge),
      const Divider(height:28),
      ...['id  •  INTEGER PRIMARY KEY','name  •  TEXT','roll  •  TEXT','course  •  TEXT'].map((x)=>Padding(
        padding:const EdgeInsets.symmetric(vertical:6),child:Text(x)))
    ]))));
}
