import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
/// Created by 华惠友
/// on 2020/10/27 5:09 PM
/// description: 

final themeDataReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, RefreshThemeAction>(_refresh)
]);

ThemeData _refresh(ThemeData themeData, RefreshThemeAction action) {
  themeData = action.themeData;
  return themeData;
}


class RefreshThemeAction {
  final ThemeData themeData;

  RefreshThemeAction(this.themeData);
}