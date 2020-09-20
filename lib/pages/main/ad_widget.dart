import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';

/// ad广告
Widget adWidget() {
  return Container(
    alignment: Alignment.center,
    height: dusetHeight(100),
    padding: EdgeInsets.all(dusetWidth(20)),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: dusetWidth(20)),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(Borders.primaryBorder),
        borderRadius: Radi.k6pxRadius,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tired of Ads? Get Premium - \$9.99",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: dusetFontSize(18),
            ),
          ),
        ],
      ),
    ),
  );
}
