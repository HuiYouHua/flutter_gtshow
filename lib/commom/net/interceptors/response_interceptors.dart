import 'package:dio/dio.dart';

import '../code.dart';
import '../result_data.dart';


/// Created by 华惠友
/// on 2021/10/13 5:25 PM
/// description:

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response) async {
    RequestOptions option = response.request;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if ((header != null && header.toString().contains("text"))) {
        return new ResultData(response.data, true);
      }

      ///一般只需要处理200的情况，300、400、500保留错误信息
      if (response.statusCode == 200 || response.statusCode == 201) {
        int code = response.data["code"];
        if (code == 0) {
          String message = response.data["msg"] ?? response.data["message"];
          return new ResultData(response.data, true, code: code, message: message);
        } else if (code == 401 || code == 30405) {
          ///token失效 登出

        } else {
//          Fluttertoast.showToast(msg: response.data["msg"]);
          return new ResultData(response.data, false);
        }
      }
    } catch (e) {
      print(e.toString() + option.path);

      return new ResultData(response.data, false);
    }

    return new ResultData(response.data, false);
  }
}
