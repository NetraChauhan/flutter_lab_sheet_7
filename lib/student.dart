class Student{
  final int? id;
  final String name, roll, course;
  const Student({this.id,required this.name,required this.roll,required this.course});
  Map<String,Object?> toMap()=>{'id':id,'name':name,'roll':roll,'course':course};
  factory Student.fromMap(Map<String,Object?> m)=>Student(
    id:m['id'] as int?,name:m['name'] as String,roll:m['roll'] as String,course:m['course'] as String);
  Student copyWith({int? id,String? name,String? roll,String? course})=>Student(
    id:id??this.id,name:name??this.name,roll:roll??this.roll,course:course??this.course);
}
