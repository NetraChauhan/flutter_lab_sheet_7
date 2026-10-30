import 'package:flutter/material.dart';
import 'student.dart';

ThemeData labTheme()=>ThemeData(
  useMaterial3:true,
  colorScheme:ColorScheme.fromSeed(
    seedColor:const Color(0xFF5B5FEF),
    brightness:Brightness.light,
  ),
  scaffoldBackgroundColor:const Color(0xFFF7F8FC),
  appBarTheme:const AppBarTheme(
    backgroundColor:Colors.transparent,
    elevation:0,
    centerTitle:false,
    titleTextStyle:TextStyle(
      color:Color(0xFF20233A),
      fontSize:18,
      fontWeight:FontWeight.w700,
    ),
    iconTheme:IconThemeData(color:Color(0xFF20233A)),
  ),
  cardTheme:CardThemeData(
    elevation:0,
    color:Colors.white,
    margin:EdgeInsets.zero,
    shape:RoundedRectangleBorder(
      borderRadius:BorderRadius.all(Radius.circular(22)),
      side:BorderSide(color:Color(0xFFE8EAF3)),
    ),
  ),
  inputDecorationTheme:InputDecorationTheme(
    filled:true,
    fillColor:Colors.white,
    contentPadding:const EdgeInsets.symmetric(horizontal:16,vertical:15),
    border:OutlineInputBorder(
      borderRadius:BorderRadius.circular(14),
      borderSide:const BorderSide(color:Color(0xFFE3E6F0)),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius:BorderRadius.circular(14),
      borderSide:const BorderSide(color:Color(0xFFE3E6F0)),
    ),
    focusedBorder:OutlineInputBorder(
      borderRadius:BorderRadius.circular(14),
      borderSide:const BorderSide(color:Color(0xFF5B5FEF),width:1.8),
    ),
  ),
  filledButtonTheme:FilledButtonThemeData(
    style:FilledButton.styleFrom(
      padding:const EdgeInsets.symmetric(horizontal:20,vertical:15),
      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
      textStyle:const TextStyle(fontWeight:FontWeight.w700),
    ),
  ),
);

IconData _iconFor(String title){
  final t=title.toLowerCase();
  if(t.contains('search'))return Icons.search_rounded;
  if(t.contains('delete')||t.contains('clear'))return Icons.delete_sweep_rounded;
  if(t.contains('update'))return Icons.edit_rounded;
  if(t.contains('sort'))return Icons.sort_by_alpha_rounded;
  if(t.contains('count'))return Icons.numbers_rounded;
  if(t.contains('course'))return Icons.filter_alt_rounded;
  if(t.contains('model'))return Icons.account_tree_rounded;
  if(t.contains('manager'))return Icons.groups_rounded;
  if(t.contains('insert')||t.contains('add'))return Icons.person_add_alt_1_rounded;
  if(t.contains('table'))return Icons.table_chart_rounded;
  if(t.contains('database')||t.contains('sqlite'))return Icons.storage_rounded;
  return Icons.school_rounded;
}

class LabPage extends StatelessWidget{
  final String title,subtitle;
  final Widget child;

  const LabPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context){
    final icon=_iconFor(title);
    return Scaffold(
      body:Container(
        decoration:const BoxDecoration(
          gradient:LinearGradient(
            begin:Alignment.topCenter,
            end:Alignment.bottomCenter,
            colors:[Color(0xFFF7F8FC),Color(0xFFFDFDFF)],
          ),
        ),
        child:Center(
          child:ConstrainedBox(
            constraints:const BoxConstraints(maxWidth:780),
            child:ListView(
              padding:const EdgeInsets.fromLTRB(24,8,24,36),
              children:[
                Container(
                  padding:const EdgeInsets.all(24),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(
                      begin:Alignment.topLeft,
                      end:Alignment.bottomRight,
                      colors:[Color(0xFF5559E8),Color(0xFF7679F5)],
                    ),
                    borderRadius:BorderRadius.circular(26),
                    boxShadow:[
                      BoxShadow(
                        color:const Color(0xFF5B5FEF).withOpacity(.18),
                        blurRadius:24,
                        offset:const Offset(0,10),
                      ),
                    ],
                  ),
                  child:Row(
                    children:[
                      Container(
                        width:58,height:58,
                        decoration:BoxDecoration(
                          color:Colors.white.withOpacity(.16),
                          borderRadius:BorderRadius.circular(18),
                        ),
                        child:Icon(icon,color:Colors.white,size:30),
                      ),
                      const SizedBox(width:18),
                      Expanded(
                        child:Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children:[
                            Text(
                              title,
                              style:const TextStyle(
                                color:Colors.white,
                                fontSize:25,
                                fontWeight:FontWeight.w800,
                                height:1.1,
                              ),
                            ),
                            const SizedBox(height:7),
                            Text(
                              subtitle,
                              style:TextStyle(
                                color:Colors.white.withOpacity(.88),
                                fontSize:14,
                                fontWeight:FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height:20),
                Container(
                  padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    color:Colors.white,
                    borderRadius:BorderRadius.circular(24),
                    border:Border.all(color:const Color(0xFFE8EAF3)),
                    boxShadow:[
                      BoxShadow(
                        color:const Color(0xFF262A5A).withOpacity(.05),
                        blurRadius:20,
                        offset:const Offset(0,8),
                      ),
                    ],
                  ),
                  child:child,
                ),
              ],
            ),
          ),
        ),
      ),
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
      color:const Color(0xFFF9FAFE),
      borderRadius:BorderRadius.circular(17),
      border:Border.all(color:const Color(0xFFE9EBF5)),
    ),
    child:ListTile(
      contentPadding:const EdgeInsets.symmetric(horizontal:14,vertical:6),
      leading:Container(
        width:46,height:46,
        alignment:Alignment.center,
        decoration:BoxDecoration(
          gradient:const LinearGradient(
            colors:[Color(0xFFE3E4FF),Color(0xFFF0E9FF)],
          ),
          borderRadius:BorderRadius.circular(14),
        ),
        child:Text(
          s.name[0].toUpperCase(),
          style:const TextStyle(
            color:Color(0xFF4B4FD6),
            fontWeight:FontWeight.w800,
            fontSize:18,
          ),
        ),
      ),
      title:Text(
        s.name,
        style:const TextStyle(
          color:Color(0xFF24273C),
          fontWeight:FontWeight.w700,
        ),
      ),
      subtitle:Padding(
        padding:const EdgeInsets.only(top:4),
        child:Text(
          s.roll+'  •  '+s.course,
          style:const TextStyle(color:Color(0xFF70758B)),
        ),
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
