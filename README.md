# Flutter Lab Sheet 7

**Topic:** Flutter SQLite Database Basics (CRUD Operations)

This repository contains 17 standalone Flutter programs for Lab Sheet 7.

## First-time setup

```bash
flutter pub get
dart run sqflite_common_ffi_web:setup
```

The second command creates the SQLite Web worker and WASM files required for Chrome.

## Run

```bash
flutter run -d chrome -t lib/program_01.dart
```

Change `program_01.dart` to `program_02.dart` ... `program_17.dart`.

## Programs

1. Create SQLite database
2. Create students table
3. Insert using `insert()`
4. Insert from TextFields
5. Insert using `rawInsert()`
6. Display using `query()`
7. Display using `rawQuery()`
8. Update record using `update()`
9. Delete record using `delete()`
10. Clear all records
11. Search by roll number using WHERE
12. Filter by course using DropdownButton
13. Sort by name using orderBy
14. Count total records
15. Student model with `toMap()` and `fromMap()`
16. DatabaseHelper CRUD
17. Student Record Management Application
