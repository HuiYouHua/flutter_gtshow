
import 'package:flutter/cupertino.dart';
import 'package:flutter_sqlite_demo/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';

///数据库操作基类
abstract class DBProvider {

  bool isTableExits = false;

  /// sql语句
  tableSqlString();

  /// 表名
  tableName();

  /// 创建表, 子类可复写该方法创建表
  tableCreate(String tableName, String columnId) {
    return '''
      create table $tableName (
        $columnId integer primary key autoincrement,
    ''';
  }

  Future<Database> getDataBase() async {
    return await open();
  }

  @mustCallSuper  ///@mustCallSuper表示子类重写的话一定要调用super.prepare()
  prepare(name, String createSql) async {
    isTableExits = await DBManager.isTableExits(name);
    if (!isTableExits) {
      Database db = await DBManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  @mustCallSuper
  open() async {
    if (!isTableExits) {
      await prepare(tableName(), tableSqlString());
    }
    return await DBManager.getCurrentDatabase();
  }
}