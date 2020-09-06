import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> toastInfo({
  @required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    timeInSecForIos: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: dusetFontSize(16)
  );
}