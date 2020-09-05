import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _buildPageHeader() {
    return Container(
      margin: EdgeInsets.only(top: dusetHeight(60.0)),
      child: Text('Feature', style: TextStyle(
        color: AppColors.primaryTest,
        fontFamily: 'Montserrat',
        fontSize: dusetFontSize(24),
        fontWeight: FontWeight.w400,
      ),),
    );
  }

  Widget _buildPageHeaderDetail() {
    return null;
  }

  Widget _buildPageItems() {
    return null;
  }

  Widget _buildPageButton() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          _buildPageHeader(),
          _buildPageHeaderDetail(),
          _buildPageItems(),
          _buildPageButton(),
        ]),
      ),
    );
  }
}
