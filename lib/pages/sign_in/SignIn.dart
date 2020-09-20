import 'package:flutter/material.dart';
import 'package:flutter_news/common/api/user.dart';
import 'package:flutter_news/common/entity/user.dart';
import 'package:flutter_news/common/utils/security.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/common/widgets/input.dart';
import 'package:flutter_news/common/widgets/widget.dart';
import 'package:flutter_news/global.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailcontroller;
  TextEditingController pwdcontroller;

  @override
  initState() {
    emailcontroller = TextEditingController(text: 'huijiawe.i@163.com');
    pwdcontroller = TextEditingController(text: '123123');
  }
  
  Future _handleNavSignup(BuildContext context) {
    Navigator.pushNamed(context, "/sign-up");
  }

  void _handleSignIn() async {
    // if (!duIsEmail(emailcontroller.value.text)) {
    //   toastInfo(msg: '请正确输入邮件');
    //   return;
    // }
    // if (!duCheckStringLength(pwdcontroller.value.text, 6)) {
    //   toastInfo(msg: '密码不能小于6位');
    //   return;
    // }
    // LoginRequestEntity params = LoginRequestEntity(email: emailcontroller.value.text, password: duSHA256(pwdcontroller.value.text));
    // LoginResponseEntity res = await UserAPI.login(context: context, options: params);
    // Global.saveProfile(res);
    Navigator.pushNamed(context, "/app");
  }

  // 跳转 注册界面
  _handleNavSignUp() {
    // ExtendedNavigator.rootNavigator.pushNamed(Routes.signUpPageRoute);
  }

  // 登录
  Widget _buildLogo() {
    return Container(
      width: dusetWidth(110),
      margin: EdgeInsets.only(top: dusetFontSize(
        40 + 44.0
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: dusetWidth(76),
            height: dusetHeight(76),
            margin: EdgeInsets.symmetric(horizontal: dusetWidth(15)),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: dusetWidth(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadows
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(dusetWidth(76 * 0.5))),
                    ),
                    child: Container(  ),
                  ),
                ),
                Positioned(
                  top: dusetWidth(13),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: dusetHeight(15)),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: dusetFontSize(24),
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: dusetFontSize(16),
              height: 1,
            ),
          ),
        ],
      )
    );
  }

  // 登录表单
  Widget _buildInputForm(context) {
    return Container(
      width: dusetWidth(295),
      margin: EdgeInsets.only(top: dusetHeight(49)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          inputTextEdit(controller: emailcontroller, keyboardType: TextInputType.emailAddress, hintText: "Email", marginTop: 0),
          inputTextEdit(controller: pwdcontroller, keyboardType: TextInputType.visiblePassword, hintText: "Password", isPassword: true),
          Container(
            height: dusetHeight(44),
            margin: EdgeInsets.only(top: dusetHeight(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                btnFlatButtonWidget(
                  onPressed: () => _handleNavSignup(context),
                  gbColor: AppColors.thirdElement,
                  title: "Sign up"
                ),
                btnFlatButtonWidget(
                  onPressed: _handleSignIn,
                  gbColor: AppColors.primaryElement,
                  title: "Sign in"
                ),
              ],
            ),
          ),
          Container(
            height: dusetHeight(22),
            margin: EdgeInsets.only(top: dusetHeight(20)),
            child: FlatButton(onPressed: () {}, child: Text(
              "Fogot password",
              style: TextStyle(
                color: AppColors.secondaryElementText,
                fontFamily: "Avenir",
                fontSize: dusetFontSize(16),
                height: 1,
                fontWeight: FontWeight.w400
              ),
            )),
          ),
        ],
      ),
    );
  }

    // 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: dusetWidth(295),
      margin: EdgeInsets.only(bottom: dusetHeight(40)),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: dusetFontSize(16),
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: dusetHeight(20)),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: dusetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: _handleNavSignUp,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputForm(context),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignupButton(),
          ],
        ),
      ),
    );
  }
}