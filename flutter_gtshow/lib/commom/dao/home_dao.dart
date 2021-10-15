import 'package:flutter_gtshow/commom/net/address.dart';
import 'package:flutter_gtshow/commom/net/http_manager.dart';
import 'package:flutter_gtshow/modules/home/index/model/room_data.dart';

/// Created by 华惠友
/// on 2021/10/14 10:52 AM
/// description: 

class HomeDao {
  static Future<List<RoomData>> jingxuanList(page) async {
    String url = Address.jingxuanList(version: GTServerVersion.v5 );
    var params  = {
      'size': 50,
      'page': 1
    };
    var result = await httpManager.get(url, params);
    var data = result.data["items"]["items"];
    if (data != null) {
      var items = getRoomDataList(data);
      return items;
    }
    return [];
  }
}