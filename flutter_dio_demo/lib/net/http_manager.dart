import 'package:dio/dio.dart';
import 'package:flutter_dio_demo/net/response_interceptors.dart';
import 'package:flutter_dio_demo/net/result_data.dart';

import 'code.dart';
import 'logs_interceptors.dart';

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
  get(url, params, {noTip = false}) async {
    Response response;
    try {
      response = await _dio.get(url, queryParameters: params);
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
        false,
        errorResponse.statusCode);
  }
}