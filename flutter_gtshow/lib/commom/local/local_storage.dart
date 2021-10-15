import 'package:shared_preferences/shared_preferences.dart';

/// Created by 华惠友
/// on 2021/10/14 10:44 AM
/// description: 


///SharedPreferences 本地存储
class LocalStorage {

  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}