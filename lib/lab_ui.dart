import 'package:flutter/material.dart';
import 'student.dart';

ThemeData labTheme()=>ThemeData(
  useMaterial3:true,
  colorScheme:ColorScheme.fromSeed(seedColor:const Color(0xFF4F46E5)),
  scaffoldBackgroundColor:const Color(0xFFF7F8FC),
  appBarTheme:const AppBarTheme(backgroundColor:Colors.transparent,elevation:0),
  cardTheme:CardThemeData(
    elevation:0,
    color:Colors.white,
    shape:RoundedRectangleBorder(
      borderRadius:BorderRadius.circular(20),
      side:const BorderSide(color:Color(0xFFE8EAF2)),
    ),
  ),
  inputDecorationTheme:InputDecorationTheme(
    filled:true,
    fillColor:Colors.white,
    border:OutlineInputBorder(
      borderRadius:BorderRadius.circular(14),
      borderSide:const BorderSide(color:Color(0xFFE2E5EE)),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius:BorderRadius.circular(14),
      borderSide:const BorderSide(color:Color(0xFFE2E5EE)),
    ),
    focusedBorder:OutlineInputBorder(
      borderRadius:BorderRadius.circular(14),
      borderSide:const BorderSide(color:Color(0xFF4F46E5),width:1.8),
    ),
  ),
);

class _Style{
  final Color a,b,bg;
  final int layout;
  final IconData icon;
  const _Style(this.a,this.b,this.bg,this.layout,this.icon);
}

_Style _style(String title){
  switch(title){
    case 'SQLite Database':
      return const _Style(Color(0xFF111827),Color(0xFF374151),Color(0xFFF3F4F6),0,Icons.storage_rounded);
    case 'Students Table':
      return const _Style(Color(0xFF0F766E),Color(0xFF14B8A6),Color(0xFFF0FDFA),1,Icons.table_chart_rounded);
    case 'Insert Student':
      return const _Style(Color(0xFFEA580C),Color(0xFFFB923C),Color(0xFFFFF7ED),2,Icons.person_add_alt_1_rounded);
    case 'Add Student':
      return const _Style(Color(0xFF2563EB),Color(0xFF60A5FA),Color(0xFFEFF6FF),3,Icons.edit_note_rounded);
    case 'Raw Insert':
      return const _Style(Color(0xFF7C3AED),Color(0xFFA78BFA),Color(0xFFF5F3FF),4,Icons.code_rounded);
    case 'All Students':
      return const _Style(Color(0xFF047857),Color(0xFF34D399),Color(0xFFECFDF5),5,Icons.view_list_rounded);
    case 'Student Records':
      return const _Style(Color(0xFF0369A1),Color(0xFF38BDF8),Color(0xFFF0F9FF),6,Icons.dataset_rounded);
    case 'Update Student':
      return const _Style(Color(0xFF6D28D9),Color(0xFFC084FC),Color(0xFFFAF5FF),7,Icons.edit_rounded);
    case 'Delete Student':
      return const _Style(Color(0xFFB91C1C),Color(0xFFF87171),Color(0xFFFEF2F2),8,Icons.delete_outline_rounded);
    case 'Clear Students':
      return const _Style(Color(0xFF9F1239),Color(0xFFFB7185),Color(0xFFFFF1F2),9,Icons.delete_sweep_rounded);
    case 'Search Student':
      return const _Style(Color(0xFF0E7490),Color(0xFF22D3EE),Color(0xFFECFEFF),10,Icons.search_rounded);
    case 'Students by Course':
      return const _Style(Color(0xFF166534),Color(0xFF84CC16),Color(0xFFF7FEE7),11,Icons.filter_alt_rounded);
    case 'Sorted Students':
      return const _Style(Color(0xFF4338CA),Color(0xFF818CF8),Color(0xFFEEF2FF),12,Icons.sort_by_alpha_rounded);
    case 'Record Count':
      return const _Style(Color(0xFFB45309),Color(0xFFFBBF24),Color(0xFFFFFBEB),13,Icons.numbers_rounded);
    case 'Student Model':
      return const _Style(Color(0xFFBE185D),Color(0xFFF472B6),Color(0xFFFDF2F8),14,Icons.account_tree_rounded);
    case 'DatabaseHelper CRUD':
      return const _Style(Color(0xFF334155),Color(0xFF64748B),Color(0xFFF8FAFC),15,Icons.settings_suggest_rounded);
    case 'Student Record Manager':
      return const _Style(Color(0xFF312E81),Color(0xFF6366F1),Color(0xFFF5F3FF),16,Icons.groups_rounded);
  }
  return const _Style(Color(0xFF4F46E5),Color(0xFF818CF8),Color(0xFFF8FAFC),2,Icons.school_rounded);
}

class LabPage extends StatelessWidget{
  final String title,subtitle;
  final Widget child;
  const LabPage({super.key,required this.title,required this.subtitle,required this.child});

  @override
  Widget build(BuildContext context){
    final s=_style(title);
    return Scaffold(
      backgroundColor:s.bg,
      body:Container(
        decoration:BoxDecoration(
          gradient:LinearGradient(
            begin:Alignment.topLeft,
            end:Alignment.bottomRight,
            colors:[s.bg,Colors.white],
          ),
        ),
        child:SafeArea(
          child:Center(
            child:ConstrainedBox(
              constraints:const BoxConstraints(maxWidth:820),
              child:ListView(
                padding:const EdgeInsets.all(26),
                children:[
                  _header(context,s),
                  const SizedBox(height:20),
                  _contentShell(s,child),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context,_Style s){
    final white=Colors.white;
    switch(s.layout){
      case 0:
        return Container(
          padding:const EdgeInsets.symmetric(vertical:30,horizontal:26),
          decoration:BoxDecoration(
            gradient:LinearGradient(colors:[s.a,s.b]),
            borderRadius:BorderRadius.circular(28),
          ),
          child:Column(children:[
            Container(
              width:72,height:72,
              decoration:BoxDecoration(color:white.withOpacity(.12),shape:BoxShape.circle),
              child:Icon(s.icon,color:white,size:36),
            ),
            const SizedBox(height:16),
            Text(title,style:const TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.w800)),
            const SizedBox(height:6),
            Text(subtitle,style:TextStyle(color:white.withOpacity(.82),fontSize:14)),
          ]),
        );
      case 1:
        return Row(children:[
          Container(width:7,height:76,decoration:BoxDecoration(color:s.a,borderRadius:BorderRadius.circular(10))),
          const SizedBox(width:16),
          Container(
            width:58,height:58,
            decoration:BoxDecoration(color:s.b.withOpacity(.14),borderRadius:BorderRadius.circular(16)),
            child:Icon(s.icon,color:s.a,size:30),
          ),
          const SizedBox(width:16),
          Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
            Text(title,style:const TextStyle(fontSize:28,fontWeight:FontWeight.w800,color:Color(0xFF172033))),
            const SizedBox(height:4),
            Text(subtitle,style:const TextStyle(color:Color(0xFF6B7280),fontSize:14)),
          ])),
        ]);
      case 4:
      case 14:
        return Container(
          padding:const EdgeInsets.all(22),
          decoration:BoxDecoration(color:const Color(0xFF111827),borderRadius:BorderRadius.circular(22)),
          child:Row(children:[
            Icon(s.icon,color:s.b,size:34),
            const SizedBox(width:15),
            Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
              Text(title,style:const TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.w800)),
              const SizedBox(height:4),
              Text(subtitle,style:TextStyle(color:Colors.white.withOpacity(.68))),
            ])),
            Container(
              padding:const EdgeInsets.symmetric(horizontal:11,vertical:6),
              decoration:BoxDecoration(color:s.b.withOpacity(.16),borderRadius:BorderRadius.circular(20)),
              child:Text('SQL',style:TextStyle(color:s.b,fontWeight:FontWeight.w800)),
            ),
          ]),
        );
      case 8:
      case 9:
        return Container(
          padding:const EdgeInsets.all(22),
          decoration:BoxDecoration(
            color:Colors.white,
            border:Border(left:BorderSide(color:s.a,width:7)),
            borderRadius:BorderRadius.circular(20),
          ),
          child:Row(children:[
            Container(
              width:54,height:54,
              decoration:BoxDecoration(color:s.b.withOpacity(.12),borderRadius:BorderRadius.circular(15)),
              child:Icon(s.icon,color:s.a),
            ),
            const SizedBox(width:16),
            Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
              Text(title,style:TextStyle(color:s.a,fontSize:26,fontWeight:FontWeight.w800)),
              const SizedBox(height:4),Text(subtitle),
            ])),
          ]),
        );
      case 10:
        return Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
          Row(children:[
            CircleAvatar(backgroundColor:s.a,radius:25,child:Icon(s.icon,color:Colors.white)),
            const SizedBox(width:13),
            Text(title,style:const TextStyle(fontSize:28,fontWeight:FontWeight.w800)),
          ]),
          const SizedBox(height:8),
          Text(subtitle,style:TextStyle(color:s.a,fontWeight:FontWeight.w600)),
        ]);
      case 13:
        return Container(
          padding:const EdgeInsets.all(20),
          decoration:BoxDecoration(
            gradient:LinearGradient(colors:[s.a,s.b]),
            borderRadius:BorderRadius.circular(22),
          ),
          child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
            Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
              Text(title,style:const TextStyle(color:Colors.white,fontSize:26,fontWeight:FontWeight.w800)),
              const SizedBox(height:5),
              Text(subtitle,style:TextStyle(color:white.withOpacity(.8))),
            ]),
            Icon(s.icon,color:Colors.white,size:44),
          ]),
        );
      case 16:
        return Container(
          padding:const EdgeInsets.all(24),
          decoration:BoxDecoration(
            gradient:LinearGradient(colors:[s.a,s.b]),
            borderRadius:BorderRadius.circular(30),
          ),
          child:Row(children:[
            Container(
              width:64,height:64,
              decoration:BoxDecoration(color:Colors.white.withOpacity(.15),borderRadius:BorderRadius.circular(20)),
              child:Icon(s.icon,color:Colors.white,size:34),
            ),
            const SizedBox(width:18),
            Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
              const Text('STUDENT DATABASE',style:TextStyle(color:Color(0xFFC7D2FE),fontSize:12,fontWeight:FontWeight.w800,letterSpacing:1.5)),
              const SizedBox(height:4),
              Text(title,style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w800)),
              const SizedBox(height:5),
              Text(subtitle,style:TextStyle(color:white.withOpacity(.8))),
            ])),
          ]),
        );
      default:
        return Row(children:[
          Container(
            width:58,height:58,
            decoration:BoxDecoration(
              gradient:LinearGradient(colors:[s.a,s.b]),
              borderRadius:BorderRadius.circular(s.layout.isEven?18:29),
            ),
            child:Icon(s.icon,color:Colors.white,size:30),
          ),
          const SizedBox(width:16),
          Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
            Text(title,style:const TextStyle(fontSize:27,fontWeight:FontWeight.w800,color:Color(0xFF172033))),
            const SizedBox(height:4),
            Text(subtitle,style:TextStyle(color:s.a,fontWeight:FontWeight.w600)),
          ])),
        ]);
    }
  }

  Widget _contentShell(_Style s,Widget child){
    if(s.layout==5 || s.layout==6 || s.layout==12){
      return Container(
        padding:const EdgeInsets.all(16),
        decoration:BoxDecoration(
          color:Colors.white.withOpacity(.72),
          borderRadius:BorderRadius.circular(22),
          border:Border.all(color:s.b.withOpacity(.22)),
        ),
        child:child,
      );
    }
    if(s.layout==13){
      return child;
    }
    if(s.layout==16){
      return Container(
        padding:const EdgeInsets.all(22),
        decoration:BoxDecoration(
          color:Colors.white,
          borderRadius:BorderRadius.circular(26),
          boxShadow:[BoxShadow(color:s.a.withOpacity(.08),blurRadius:25,offset:const Offset(0,10))],
        ),
        child:child,
      );
    }
    return Container(
      padding:const EdgeInsets.all(20),
      decoration:BoxDecoration(
        color:Colors.white,
        borderRadius:BorderRadius.circular(s.layout==1?16:22),
        border:Border.all(color:s.b.withOpacity(.18)),
        boxShadow:[BoxShadow(color:s.a.withOpacity(.05),blurRadius:18,offset:const Offset(0,8))],
      ),
      child:child,
    );
  }
}

class StudentTile extends StatelessWidget{
  final Student s;
  final Widget? trailing;
  const StudentTile(this.s,{super.key,this.trailing});

  @override
  Widget build(BuildContext context)=>Container(
    margin:const EdgeInsets.only(bottom:10),
    decoration:BoxDecoration(
      color:const Color(0xFFFAFBFE),
      borderRadius:BorderRadius.circular(16),
      border:Border.all(color:const Color(0xFFE7EAF2)),
    ),
    child:ListTile(
      contentPadding:const EdgeInsets.symmetric(horizontal:14,vertical:5),
      leading:Container(
        width:44,height:44,
        alignment:Alignment.center,
        decoration:BoxDecoration(
          color:const Color(0xFFEFF1FF),
          borderRadius:BorderRadius.circular(13),
        ),
        child:Text(s.name[0].toUpperCase(),style:const TextStyle(
          color:Color(0xFF4F46E5),fontSize:17,fontWeight:FontWeight.w800)),
      ),
      title:Text(s.name,style:const TextStyle(fontWeight:FontWeight.w700)),
      subtitle:Padding(
        padding:const EdgeInsets.only(top:3),
        child:Text(s.roll+'  •  '+s.course,style:const TextStyle(color:Color(0xFF6B7280))),
      ),
      trailing:trailing,
    ),
  );
}

Widget field(TextEditingController c,String label)=>Padding(
  padding:const EdgeInsets.only(bottom:12),
  child:TextField(
    controller:c,
    decoration:InputDecoration(
      labelText:label,
      prefixIcon:Icon(
        label.toLowerCase().contains('name')
          ?Icons.person_outline_rounded
          :label.toLowerCase().contains('roll')
            ?Icons.badge_outlined
            :Icons.school_outlined,
      ),
    ),
  ),
);
