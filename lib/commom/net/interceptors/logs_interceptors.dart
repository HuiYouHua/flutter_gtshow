import 'package:dio/dio.dart';

/// Created by 华惠友
/// on 2021/10/13 5:23 PM
/// description: 

class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    print("请求baseUrl：${options.baseUrl}");
    print("请求url：${options.path}");
    print('请求头: ' + options.headers.toString());
    if (options.data != null) {
      print('请求参数: ' + options.data.toString());
    }
    return options;
  }

  @override
  onResponse(Response response) async {
    if (response != null) {
      var responseStr = response.toString();
      print(responseStr);
    }

    return response; // continue
  }

  @override
  onError(DioError err) async {
    print('请求异常: ' + err.toString());
    print('请求异常信息: ' + err.response?.toString() ?? "");
    return err;
  }
}
