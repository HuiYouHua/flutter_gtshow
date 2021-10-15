import 'package:flutter_redux_demo/model/user.dart';
import 'package:redux/redux.dart';

/// Created by 华惠友
/// on 2020/10/27 5:10 PM
/// description: 


final userReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserInfoAction>(_updateUserInfo)
]);

User _updateUserInfo(User user, UpdateUserInfoAction action) {
  user = action.userInfo;
  return user;
}


class UpdateUserInfoAction {
  User userInfo;

  UpdateUserInfoAction(this.userInfo);
}













