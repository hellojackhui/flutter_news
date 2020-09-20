import 'package:flutter/material.dart';
import 'package:flutter_news/common/entity/categories.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';

Widget newsCategoryWidget(
    {List<CategoryResponseEntity> categories,
    String selCategoryCode,
    Function(CategoryResponseEntity) onTap}) {
  return categories == null
      ? Container()
      : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map<Widget>((item) {
              return Container(
                alignment: Alignment.center,
                height: dusetHeight(52),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: selCategoryCode == item.code ? AppColors.secondaryElementText : AppColors.primaryText,
                      fontSize: dusetFontSize(18),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  onTap: () => onTap(item),
                ),
              );
            }).toList(),
          ));
}
