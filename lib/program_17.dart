import 'package:flutter/material.dart';
import 'database_helper.dart';import 'student.dart';import 'lab_ui.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:labTheme(),home:const App()));
class App extends StatefulWidget{const App({super.key});State<App> createState()=>_S();}
class _S extends State<App>{
  final db=DatabaseHelper('q17.db'),n=TextEditingController(),r=TextEditingController(),c=TextEditingController(text:'BCA');
  List<Student> list=[];int? editing;
  @override void initState(){super.initState();load();}
  Future<void> load()async{list=await db.read(orderBy:'name ASC');if(mounted)setState((){});}
  Future<void> save()async{
    final s=Student(id:editing,name:n.text,roll:r.text,course:c.text);
    editing==null?await db.insert(s):await db.update(s);
    n.clear();r.clear();c.text='BCA';editing=null;await load();
  }
  void edit(Student s){n.text=s.name;r.text=s.roll;c.text=s.course;setState(()=>editing=s.id);}
  @override Widget build(x)=>LabPage(title:'Student Record Manager',subtitle:'SQLite CRUD Application',child:Column(children:[
    Card(child:Padding(padding:const EdgeInsets.all(18),child:Column(children:[
      Text(editing==null?'Add Student':'Update Student',style:Theme.of(x).textTheme.titleLarge),
      const SizedBox(height:14),field(n,'Name'),field(r,'Roll Number'),field(c,'Course'),
      SizedBox(width:double.infinity,child:FilledButton(onPressed:save,child:Text(editing==null?'Add Student':'Save Changes')))
    ]))),
    const SizedBox(height:14),
    if(list.isEmpty)const Card(child:ListTile(title:Text('No records yet'),subtitle:Text('Add your first student above.'))),
    ...list.map((s)=>StudentTile(s,trailing:Wrap(spacing:2,children:[
      IconButton(icon:const Icon(Icons.edit_outlined),onPressed:()=>edit(s)),
      IconButton(icon:const Icon(Icons.delete_outline),onPressed:()async{await db.delete(s.id!);await load();})
    ])))
  ]));
}
