import 'dart:io';


import 'package:flutter_sqlite_demo/db/db_string_const.dart';
import 'package:flutter_sqlite_demo/utils/global_const.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

///数据库管理
class DBManager {

  static const _VERSION = 1;
  static Database _database;

  static init() async {
    var databasePath = await getDataBasePath();
    print(databasePath);
    _database = await openDatabase(databasePath, version: _VERSION,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          //await db.execute("CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)");
        });
  }

  ///表是否存在
  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _database.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  ///获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await init();
    }
    return _database;
  }

  ///关闭
  static close() {
    _database?.close();
    _database = null;
  }

  ///获取数据库存储路径
  static getDataBasePath() async {
    var app = await getApplicationSupportDirectory();
    if (Platform.isIOS) {
      var dbPath = '';
      if (GlobalConst.isProduction) {
        dbPath = '${app.path}/${DBStringConst.localDbName}';
      } else {
        dbPath = '${app.path}/${DBStringConst.localDebugDbName}';
      }
      return dbPath;
    } else {
      return '';
    }
  }
}


