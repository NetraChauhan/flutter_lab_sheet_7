import 'package:flutter/material.dart';
import 'student.dart';

ThemeData labTheme()=>ThemeData(
  useMaterial3:true,
  colorScheme:ColorScheme.fromSeed(seedColor:const Color(0xFF315CFF)),
  scaffoldBackgroundColor:const Color(0xFFF5F7FB),
  inputDecorationTheme:const InputDecorationTheme(
    border:OutlineInputBorder(),filled:true,fillColor:Colors.white));

class LabPage extends StatelessWidget{
  final String title,subtitle;
  final Widget child;

  const LabPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child
  });

  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:Text(title)),
    body:Center(
      child:ConstrainedBox(
        constraints:const BoxConstraints(maxWidth:720),
        child:ListView(
          padding:const EdgeInsets.all(24),
          children:[
            Text(subtitle,style:Theme.of(context).textTheme.titleMedium),
            const SizedBox(height:18),
            child
          ]
        )
      )
    )
  );
}

class StudentTile extends StatelessWidget{
  final Student s;
  final Widget? trailing;

  const StudentTile(this.s,{super.key,this.trailing});

  @override
  Widget build(BuildContext context)=>Card(
    child:ListTile(
      leading:CircleAvatar(child:Text(s.name[0])),
      title:Text(s.name),
      subtitle:Text(s.roll+'  •  '+s.course),
      trailing:trailing
    )
  );
}

Widget field(TextEditingController c,String label)=>Padding(
  padding:const EdgeInsets.only(bottom:12),
  child:TextField(
    controller:c,
    decoration:InputDecoration(labelText:label)
  )
);
