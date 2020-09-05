import 'package:flutter_screenutil/flutter_screenutil.dart';

double dusetWidth(double width) {
  return ScreenUtil().setWidth(width);
}

double dusetHeight(double height) {
  return ScreenUtil().setHeight(height);
}

double dusetFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}