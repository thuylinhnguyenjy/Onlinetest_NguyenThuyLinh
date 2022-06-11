import 'dart:async';
import 'dart:developer';
import 'dart:io' show Directory;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../models/usermodel.dart';

class DBHelper {
  static Database? _db;
  static const String DBNAME = "user.db";

  get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DBNAME);
    return await openDatabase(path, version: 1, onCreate: createTable);
  }

  createTable(Database db, int version) async {
    String tbName = "users";
    String tbCol1 = "username";
    String tbCol2 = "password";
    String query = "CREATE TABLE $tbName ($tbCol1 TEXT PRIMARY KEY, $tbCol2 TEXT)";
    await db.execute(query);
  }

  Future<dynamic> createNewUser(User user) async {
    final dbget = await db;
    var res = await dbget.rawInsert("INSERT Into users (username, password) VALUES ('${user.username}','${user.password}')");
    return res;
  }

  Future<String> loginByUsername(User user) async {
    final dbget = await db;
    var res = await dbget.query("users", where: "username = ?", whereArgs: [user.username]);
    return User.fromMap(res[0]).password.toString();
    //return users;//   return res.isNotEmpty ? User.fromMap(res.first) : Null;
  }

}
