import 'package:flutter/material.dart';
import 'package:flutter_news/common/entity/entities.dart';
import 'package:flutter_news/common/utils/http.dart';

/// 登录class
class UserAPI {
  /// 登录接口
  static Future<LoginResponseEntity> login({
    @required BuildContext context,
    LoginRequestEntity options
  }) async {
    var response = await HttpUtil().post(
      '/login',
      context: context,
      params: options
    );
    return LoginResponseEntity.fromJson(response);
  }
}