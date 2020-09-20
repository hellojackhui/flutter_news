

import 'package:flutter/material.dart';
import 'package:flutter_news/pages/home/Home.dart';
import 'package:flutter_news/pages/sign_in/SignIn.dart';
import 'package:flutter_news/pages/sign_up/SignUp.dart';

var routes = {
  '/sign-in': (BuildContext context) => SignInPage(),
  '/sign-up': (BuildContext context) => SignUpPage(),
  '/app': (BuildContext context) => Home(),
};