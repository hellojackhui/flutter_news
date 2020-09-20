import 'package:flutter/material.dart';
import 'package:flutter_news/common/api/news.dart';
import 'package:flutter_news/common/entity/categories.dart';
import 'package:flutter_news/common/entity/channels.dart';
import 'package:flutter_news/common/entity/news.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/pages/main/ad_widget.dart';
import 'package:flutter_news/pages/main/category_widget.dart';
import 'package:flutter_news/pages/main/channels_widget.dart';
import 'package:flutter_news/pages/main/news_item_widget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NewsPageListResponseEntity _newsPageListRequestEntity;
  NewsItem _newsRecommendRequestEntity;
  List<CategoryResponseEntity> _categories;
  List<ChannelResponseEntity> _channels;

  String _selCategoryCode;

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  Future<void> _loadAllData() async {
    _newsPageListRequestEntity = await NewsAPI.newsPageList(context: context);
    _newsRecommendRequestEntity = await NewsAPI.newsRecommend(context: context);
    _categories = await NewsAPI.categories(context: context);
    _channels = await NewsAPI.channels(context: context);

    _selCategoryCode = _categories.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return _categories == null
        ? Container()
        : newsCategoryWidget(
            categories: _categories,
            selCategoryCode: _selCategoryCode,
            onTap: (CategoryResponseEntity item) {
              _loadNewsData(item.code);
            },
          );
  }

  Future _loadNewsData(String code) {}

  // 推荐阅读
  Widget _buildRecommend() {
    return _newsRecommendRequestEntity == null // 数据没到位，可以用骨架图展示
        ? Container()
        : recommendWidget(_newsRecommendRequestEntity);
  }

  Widget recommendWidget(NewsItem item) {}

  // 频道
  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : newsChannelsWidget(
            channels: _channels,
            onTap: (ChannelResponseEntity item) {},
          );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return _newsPageListRequestEntity == null
        ? Container(
            height: dusetHeight(161 * 5 + 100.0),
          )
        : Column(
            children: _newsPageListRequestEntity.items.map((item) {
              // 新闻行
              List<Widget> widgets = <Widget>[
                newsItem(item),
                Divider(height: 1),
              ];

              // 每 5 条 显示广告
              int index = _newsPageListRequestEntity.items.indexOf(item);
              if (((index + 1) % 5) == 0) {
                widgets.addAll(<Widget>[
                  adWidget(),
                  Divider(height: 1),
                ]);
              }

              // 返回
              return Column(
                children: widgets,
              );
            }).toList(),
          );
  }

  Widget _buildSubscribe() {
    return Container(
      height: dusetHeight(259),
      color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        _buildCategories(),
        _buildRecommend(),
        _buildChannels(),
        _buildNewsList(),
        _buildSubscribe(),
      ]),
    );
  }
}
