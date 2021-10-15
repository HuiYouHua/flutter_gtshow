import 'dart:ui';

import 'package:flutter/material.dart';

/// Created by 华惠友
/// on 2021/10/14 3:37 PM
/// description: 
class GTTextStyle {
  // DINPro-Light
  static lightTextStyle({Color color = Colors.black, double fontSize = 12}) {
    return TextStyle(
      fontFamily: 'DINPro',
      fontWeight: FontWeight.w200,
      color: color,
      fontSize: fontSize,
    );
  }

  // DINPro-Regular
  static regularTextStyle({Color color = Colors.black, double fontSize = 12}) {
    return TextStyle(
      fontFamily: 'DINPro',
      fontWeight: FontWeight.normal,
      color: color,
      fontSize: fontSize,
    );
  }

  // DINPro-Medium
  static mediumTextStyle({Color color = Colors.black, double fontSize = 12}) {
    return TextStyle(
      fontFamily: 'DINPro',
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: fontSize,
    );
  }

  // DINPro-Bold
  static boldTextStyle({Color color = Colors.black, double fontSize = 12}) {
    return _setTextStyle(
      fontFamily: 'DINPro',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: fontSize,
    );
  }

  // DINPro-Black
  static blackTextStyle({Color color = Colors.black, double fontSize = 12}) {
    return _setTextStyle(
      fontFamily: 'DINPro',
      fontWeight: FontWeight.w900,
      color: color,
      fontSize: fontSize,
    );
  }

  static _setTextStyle({String fontFamily,
    FontWeight fontWeight,
    Color color,
    double fontSize}) {
    return TextStyle(
      fontFamily: 'DINPro',
      fontWeight: FontWeight.w900,
      color: color,
      fontSize: fontSize,
    );
  }
}