/// Created by 华惠友
/// on 2021/10/13 5:25 PM
/// description: 

class ResultData {
  ///结果数据
  var data;
  ///请求是否成功
  bool isSuccess;
  ///业务code码
  int code;
  ///业务信息
  String message;


  ResultData(this.data, this.isSuccess, {this.code, this.message});
}