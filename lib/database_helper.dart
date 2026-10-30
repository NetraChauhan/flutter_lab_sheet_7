import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'student.dart';

class DatabaseHelper{
  final String name;
  Database? _db;
  DatabaseHelper(this.name);
  Future<Database> get database async{
    if(_db!=null)return _db!;
    if(kIsWeb) databaseFactory=databaseFactoryFfiWeb;
    _db=await openDatabase(name,version:1,onCreate:(db,v)=>db.execute(
      'CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, roll TEXT, course TEXT)'));
    return _db!;
  }
  Future<int> insert(Student s) async=>(await database).insert('students',s.toMap()..remove('id'));
  Future<List<Student>> read({String? orderBy}) async=>(await database).query('students',orderBy:orderBy).then((r)=>r.map(Student.fromMap).toList());
  Future<int> update(Student s) async=>(await database).update('students',s.toMap()..remove('id'),where:'id=?',whereArgs:[s.id]);
  Future<int> delete(int id) async=>(await database).delete('students',where:'id=?',whereArgs:[id]);
  Future<int> clear() async=>(await database).delete('students');
  Future<void> seed() async{
    if((await read()).isNotEmpty)return;
    await insert(const Student(name:'Aarav Mehta',roll:'BCA101',course:'BCA'));
    await insert(const Student(name:'Mira Kapoor',roll:'BCA102',course:'BCA'));
    await insert(const Student(name:'Kabir Shah',roll:'BBA201',course:'BBA'));
  }
}
