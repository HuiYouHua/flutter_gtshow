import 'package:dio/dio.dart';

import 'code.dart';

import 'interceptors/logs_interceptors.dart';
import 'interceptors/response_interceptors.dart';
import 'result_data.dart';

/// Created by 华惠友
/// on 2021/10/13 5:23 PM
/// description:

final HttpManager httpManager = new HttpManager();

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  Dio _dio;


  HttpManager() {
    if (null == _dio) {
      _dio = new Dio();
      _dio.interceptors.add(new LogsInterceptors());
      _dio.interceptors.add(new ResponseInterceptors());
    }
  }

  ///通用的GET请求
  Future<ResultData> get(url, params, {noTip = false}) async {
    Response response;
    try {
//      var headers = {
//        "content-type":
//        HttpManager.CONTENT_TYPE_FORM
//      };
      var option = Options();
//      option.headers = headers;
      response = await _dio.get(url, queryParameters: params, options: option);
    } on DioError catch (e) {
      return resultError(e, noTip);
    }

    if (response.data is DioError) {
      return resultError(response.data, noTip);
    }

    return response.data;
  }

  ///通用的POST请求
  post(url, params, {noTip = false}) async {
    Response response;

    try {
      response = await _dio.post(url, data: params);
    } on DioError catch (e) {
      return resultError(e, noTip);
    }

    if (response.data is DioError) {
      return resultError(response.data, noTip);
    }

    return response.data;
  }

  resultError(DioError e, [noTip = false]) {
    Response errorResponse;
    if (e.response != null) {
      errorResponse = e.response;
    } else {
      errorResponse = new Response(statusCode: 666);
    }
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.RECEIVE_TIMEOUT) {
      errorResponse.statusCode = Code.NETWORK_TIMEOUT;
    }
    return new ResultData(
        Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
        false);
  }
}