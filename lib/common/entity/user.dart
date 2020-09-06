import 'package:flutter/material.dart';

class LoginRequestEntity {
  final String email;
  final String password;
  const LoginRequestEntity({
    @required this.email,
    @required this.password,
  });
  factory LoginRequestEntity.fromJson(Map<String, dynamic> json) {
    return LoginRequestEntity(email: json['email'], password: json['password']);
  }
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password
    };
  }
}

class LoginResponseEntity {
  final String accessToken;
  final String displayName;
  final List<String> channels;

  const LoginResponseEntity({@required this.accessToken, this.displayName, this.channels});

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) {
    return LoginResponseEntity(
      accessToken: json['accessToken'], 
      displayName: json['displayName'], 
      channels: List.from(json['channels']).map((x) => x));
  }
  Map<String, dynamic> toJson() {
    return {
      "accessToken": accessToken,
      "displayName": displayName,
      "channels": List.from(channels).map((x) => x),
    };
  }

}