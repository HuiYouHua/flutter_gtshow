/// Created by 华惠友
/// on 2021/10/13 5:25 PM
/// description: 

class ResultData {
  var data;
  bool isSuccess;
  int code;
  var headers;

  ResultData(this.data, this.isSuccess, this.code, {this.headers});
}