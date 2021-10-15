import 'dart:convert' as convert;

import 'package:flutter_sqlite_demo/db/provider/login_user_db_provider.dart';
import 'package:flutter_sqlite_demo/model/login_user_model.dart';



/// Created by 华惠友
/// on 2020/7/29 10:49 AM
/// description: 模拟数据json

class UserInfoMock {
  ///用户信息
  static final userInfo = '''
  {"userName":"huayoyu","user":{"finance":{"bean_count_total":32020,"bean_count":32020,"coin_spend_total":708379506,"coin_count":4999999999300111312},"bean_rank":-1,"mobile_bind":true,"user_name":"huayoyu","detail_info":{"mobile_bind":true,"mobile":"15056953149"},"bank_info_verify":0,"canCreatChatPage":true,"vip_hiding":0,"via":"local","location":"","access_token":"a6d47a263e71f2b97594413729632e66","master":0,"real_authed":false,"status":true,"vip_expires":0,"id":0,"mm_no":20884761,"_id":20884761,"years":0,"enabled_app_push":true,"followers":0,"isTemp":false,"pic":"http://test.img.sumeme.com/23/7/1516764526295.jpg","sex":0,"vip":0,"constellation":0,"spend":0,"priv":3,"first_login":false,"rongcloud":{"token":"s12HJoJ\/0rO\/mofXtELvs5Y\/2kqachxq9HFElHHpHqw=@t4em.cn.rongnav.com;t4em.cn.rongcfg.com","timestamp":1595732858271},"nick_name":"美团大军tr","timestamp":1586938890162,"nickname":""},"log_off":false,"phoneNumber":"","recharge_count":0,"myPrivilegeCount":0,"token":"a6d47a263e71f2b97594413729632e66","passWord":"aA123456","refreshToken":"490260295c6efc09bd4b2a94bf64f2ce","recommendPhrase":[]}
  ''';

  ///将mock json数据转为模型读到全局变量中, 并插入数据库
  static getUserInfoModel() async {
    Map<String, dynamic> user = convert.jsonDecode(UserInfoMock.userInfo);
    LoginUserModel userModel = LoginUserModel.fromJson(user);
    LoginUserModel.setCurrentLoginUser(userModel);
//    print(globalLoginUser.user.pic ?? "");

    LoginUserDbProvider provider = LoginUserDbProvider();
    await provider.insert(userModel);
  }
}