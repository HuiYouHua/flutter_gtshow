import 'address.dart';
import 'data_helper.dart';
import 'http_manager.dart';

/// Created by 华惠友
/// on 2021/10/13 5:26 PM
/// description: 

class Api {
  ///示例请求
  static request() {
//    var params = DataHelper.getBaseMap();
//    params['param'] = param;
//    return HttpManager.getInstance().get(Address.TEST_API, params);
    String url = Address.jingxuangList(version: GTServerVersion.v5 );
    var params  = {
      'size': 10,
      'page': 1
    };
    httpManager.get(url, params);
  }
}