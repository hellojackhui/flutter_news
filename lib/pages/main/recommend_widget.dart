
import 'package:flutter/material.dart';
import 'package:flutter_news/common/entity/news.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widget.dart';

Widget recommendWidget(NewsItem item) {
  return Container(
    margin: EdgeInsets.all(dusetWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            // ExtendedNavigator.rootNavigator.pushNamed(
            //   Routes.detailsPageRoute,
            //   arguments: DetailsPageArguments(item: item),
            // );
          },
          child: imageCached(
            item.thumbnail,
            width: dusetWidth(335),
            height: dusetHeight(290)
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: dusetHeight(14)),
          child: Text(
            item.author,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              color: AppColors.thirdElement,
              fontSize: dusetFontSize(14)
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // ExtendedNavigator.rootNavigator.pushNamed(
            //   Routes.detailsPageRoute,
            //   arguments: DetailsPageArguments(item: item),
            // );
          },
          child: Container(
            margin: EdgeInsets.only(top: dusetHeight(10)),
            child: Text(
              item.title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
                fontSize: dusetFontSize(24)
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: dusetHeight(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ), 
                child: Text(
                  item.category,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryElementText,
                    fontSize: dusetHeight(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              Container(
                width: dusetWidth(15),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120
                ),
                child: Text(
                  '• ${duTimeLineFormat(item.addtime)}',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElement,
                    fontSize: dusetFontSize(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}