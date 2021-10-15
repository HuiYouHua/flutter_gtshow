
import 'package:flutter_sqlite_demo/db/db_provider.dart';
import 'package:flutter_sqlite_demo/db/db_string_const.dart';
import 'package:flutter_sqlite_demo/model/login_user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert' as convert;

/// Created by 华惠友
/// on 2020/7/28 12:29 PM
/// description:

class LoginUserDbProvider extends DBProvider {

  LoginUserDbProvider();


  @override
  tableSqlString() {
    return tableCreate(DBStringConst.loginUserDbTableName, DBStringConst.id) +
    '''
    ${DBStringConst.userId} integer,
    ${DBStringConst.timestamp} integer,
    ${DBStringConst.jsonData} text, 
     unique(${DBStringConst.userId})) 
    ''';
  }

  @override
  tableName() {
    return DBStringConst.loginUserDbTableName;
  }

  ///查询数据库
  Future _getUserInfoProvider(Database db, int userId) async {

    var sql = "select * from ${tableName()} where ${DBStringConst.userId} = ${userId} limit 1";
    if (userId == 0) {
      sql = "select * from ${tableName()} order by ${DBStringConst.timestamp} desc limit 1";
    }

    List<Map<String, dynamic>> maps = await db.rawQuery(sql);
    if (maps.length > 0) {
      var userdata = maps.first;
      return userdata;
    }
    return null;
  }

  ///更新数据库
  Future insert(LoginUserModel loginUser) async {
    Database db = await getDataBase();
    var userData = await _getUserInfoProvider(db, loginUser.user.iId);
    if (userData != null) {
      await db.delete(tableName(), where: '${DBStringConst.userId} = ?', whereArgs: [loginUser.user.iId]);
    }
    var sql = "insert into ${tableName()} (${DBStringConst.userId}, ${DBStringConst.timestamp}, ${DBStringConst.jsonData}) values (?, ?, ?)";
    var data = convert.json.encode(loginUser.toJson());
    return await db.rawInsert(sql,
        [loginUser.user.iId,
        DateTime.now().millisecondsSinceEpoch/1000,
        data]
    );
  }

  ///删除某条信息
  Future delete(int userId) async {
    Database db = await getDataBase();
    var userData = await _getUserInfoProvider(db, userId);
    if (userData != null) {
      await db.delete(tableName(), where: '${DBStringConst.userId} = ?', whereArgs: [userId]);
    }
  }

  ///获取用户信息
  Future<LoginUserModel> getUserInfo(int userId) async {
    Database db = await getDataBase();
    var userData = await _getUserInfoProvider(db, userId);
    if (userData != null) {
      var userInfo = userData[DBStringConst.jsonData];
      Map<String, dynamic> user = convert.jsonDecode(userInfo);
      LoginUserModel userModel = LoginUserModel.fromJson(user);
      LoginUserModel.setCurrentLoginUser(userModel);

      ///可以在这里发送通知 或者 进行状态管理
//      store.dispatch(Action.userInfo);
      return userModel;
    }
    return null;
  }
}











