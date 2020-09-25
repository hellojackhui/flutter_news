import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widget.dart';

Widget newsletterWidget() {
  return Container(
    margin: EdgeInsets.all(dusetWidth(20)),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Newsletter',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: dusetFontSize(18),
                fontWeight: FontWeight.w600,
                color: AppColors.thirdElement,
              ),
            ),
            Spacer(),
            IconButton(icon: 
            Icon(
              Icons.close,
              color: AppColors.thirdElement,
              size: dusetFontSize(17),
            ), onPressed: () {})
          ],
        ),
        // email
        inputTextEdit(
          marginTop: 19,
          keyboardType: TextInputType.emailAddress,
          hintText: "Email",
          isPassword: false,
          controller: null,
        ),
        // btn subcrible
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: btnFlatButtonWidget(
            onPressed: () {},
            width: dusetWidth(335),
            height: dusetHeight(44),
            fontWeight: FontWeight.w600,
            title: "Subscribe",
          ),
        ),
                // disc
        Container(
          margin: EdgeInsets.only(top: dusetHeight(29)),
          width: dusetWidth(261),
          child: Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(
              text: 'By clicking on Subscribe button you agree to accept',
              style: new TextStyle(
                color: AppColors.thirdElement,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: dusetFontSize(14),
              ),
            ),
            TextSpan(
              text: ' Privacy Policy',
              style: new TextStyle(
                color: AppColors.secondaryElementText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: dusetFontSize(14),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  toastInfo(msg: 'Privacy Policy');
                },
            ),
          ])),
        ),
      ],
    ),
  );
}