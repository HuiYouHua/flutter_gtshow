import 'dart:collection';

import 'dart:convert';

/// Created by 华惠友
/// on 2021/10/13 5:26 PM
/// description: 

class DataHelper{
  static SplayTreeMap getBaseMap() {
    var map = new SplayTreeMap<String, dynamic>();
//    map["platform"] = AppConstants.platformRM;
//    map["system"] = AppConstants.SYSTEM;
//    map["channel"] = AppConstants.CHANNEL;
    map["time"] = new DateTime.now().millisecondsSinceEpoch.toString();
    return map;
  }

//  static string2MD5(String data) {
//    var content = new Utf8Encoder().convert(data);
//    var digest = md5.convert(content);
//    return hex.encode(digest.bytes);
//  }
}