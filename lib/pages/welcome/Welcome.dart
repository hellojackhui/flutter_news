import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}):super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _buildPageHeader() {
    return Container(
      margin: EdgeInsets.only(top: dusetHeight(60.0 + 44.0)),
      child: Text('Feature', style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: 'Montserrat',
        fontSize: dusetFontSize(24),
        fontWeight: FontWeight.w400,
      ),),
    );
  }

  Widget _buildPageHeaderDetail() {
    return Container(
      width: dusetWidth(242),
      height: dusetHeight(70),
      margin: EdgeInsets.only(top: dusetHeight(14)),
      child: Text(
        Strings.welcomeText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Avenir",
          fontSize: dusetFontSize(16),
          fontWeight: FontWeight.normal,
          height: 1.3,
          color: AppColors.primaryText
        ),
      ),
    );
  }

  Widget _buildPageItems(String imageName, String info, double marginTop) {
    return Container(
      width: dusetWidth(295),
      height: dusetHeight(80),
      margin: EdgeInsets.only(top: dusetHeight(marginTop)),
      child: Row(
        children: <Widget>[
          Container(
            width: dusetWidth(80),
            height: dusetHeight(80),
            child: Image.asset(
              "assets/images/$imageName.png",
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: dusetWidth(195),
            child: Text(
              info,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: dusetFontSize(16),
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                color: AppColors.primaryText
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPageButton(BuildContext context) {
    return Container(
      width: dusetFontSize(295),
      height: dusetHeight(44),
      margin: EdgeInsets.only(bottom: dusetHeight(20)),
      child: FlatButton(
        color: AppColors.primaryElement,
        textColor: AppColors.primaryElementText,
        child: Text("Get Started"),
        shape: RoundedRectangleBorder(
          borderRadius: Radi.k6pxRadius,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/sign-in');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 814 - 44 - 34, allowFontScaling: true);
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          _buildPageHeader(),
          _buildPageHeaderDetail(),
          _buildPageItems("feature-1", "Compelling photography and typography provide a beautiful reading", 86),
          _buildPageItems("feature-2", "Secotr news never shares your personal data width advertisers or publishers", 40),
          _buildPageItems("feature-3", "You can get Premium to unlock hundreds of publications", 40),
          Spacer(),
          _buildPageButton(context),
        ]),
      ),
    );
  }
}
