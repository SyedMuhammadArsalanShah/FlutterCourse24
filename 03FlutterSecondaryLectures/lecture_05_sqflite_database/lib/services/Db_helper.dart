import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db_helper {
// variable creation
  static const db_name = "smasb.db";
  static const db_version = 1;
  static const db_table = "myinfo";
  static const dt_id = "id";
  static const dt_name = "name";

//  constructor

  static final Db_helper instance = Db_helper();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await initDB();
    return _database;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, db_name);

    return openDatabase(path, version: db_version, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    await db.execute('''create table $db_table(
      $dt_id Integer Primary key,
      $dt_name Text Not null 

      )''');
  }

  insertRecord(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(db_table, row);
  }

  Future<List<Map<String, dynamic>>> querydatabase() async {
    Database? db = await instance.database;

    return await db!.query(db_table);
  }

  Future<int> updateRecord(Map<String, dynamic> row) async {
    Database? db = await instance.database;

    int id = row[dt_id];

    return await db!.update(db_table, row, where: '$dt_id=?', whereArgs: [id]);
  }

  Future<int> deleteRecord(int id) async {
    Database? db = await instance.database;

// int id = row[dt_id];

    return await db!.delete(db_table, where: '$dt_id=?', whereArgs: [id]);
  }
}
