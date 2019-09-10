import 'dart:io';
import 'package:easy_control/models/spent.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Spent(id INTEGER PRIMARY KEY, value DECIMAL, type INTEGER, description TEXT, date DATETIME)");
    print("Table is created");
  }

//insert
  Future<int> insertSpent(Spent spent) async {
    var dbClient = await db;
    return await dbClient.insert("Spent", spent.toMap());
  }

  //delete
  Future<int> deleteSpent(Spent spent) async {
    var dbClient = await db;
    return await dbClient.rawDelete('DELETE FROM Spent WHERE id = ?', [spent.id]);
  }

  //update
  Future<bool> updateSpent(Spent spent) async {
    var dbClient = await db;
    int res =   await dbClient.update("Spent", spent.toMap(),
        where: "id = ?", whereArgs: <int>[spent.id]);
    return res > 0 ? true : false;
  }

  //getAll
  Future<List<Spent>> getSpents() async {
    final dbClient = await db;
    var res = await dbClient.query("Spent");
    List<Spent> list = res.isNotEmpty ? res.map((c) => Spent.fromMap(c)).toList() : [];
    return list;
  }
}