// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_serializable_demo/model/data.dart';
import 'package:flutter_json_serializable_demo/model/mockdata.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_json_serializable_demo/main.dart';

void main() {
  ///1.将json转为map
  Map<String, dynamic> map = json.decode(JsonString.mockdata);

  ///2.将map转为模型
  Data data = Data.fromJson(map);
  print(data);
  data.score?.toInt();

  ///遇到解析结果为null的处理方式
  print(data.title?.toString() ?? "123");
//  print('title: ' + data.title);

  Map<String, dynamic> jsonMap = data.toJson();
  String jsonStr = json.encode(jsonMap);
  print(jsonStr);
}
