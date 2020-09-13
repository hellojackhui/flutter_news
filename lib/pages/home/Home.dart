import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/app.dart';
import 'package:flutter_news/pages/category/CategoryPage.dart';
import 'package:flutter_news/pages/main/MainPage.dart';
import 'package:flutter_news/pages/my/MyPage.dart';
import 'package:flutter_news/pages/tag/TagPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  int _page = 0;
  

  final List<String> _tabTitles = [
    "welcome",
    "category",
    "bookmarks",
    "account",
  ];

  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  final List<BottomNavigationBarItem> _list = [
    BottomNavigationBarItem(
      icon: Icon(Iconfont.home, color: AppColors.tabBarElement),
      title: Text("home"),
      activeIcon: Icon(Iconfont.home, color: AppColors.secondaryElementText),
      backgroundColor: AppColors.primaryBackground
    ),
    BottomNavigationBarItem(
      icon: Icon(Iconfont.grid, color: AppColors.tabBarElement),
      title: Text("category"),
      activeIcon: Icon(Iconfont.grid, color: AppColors.secondaryElementText),
      backgroundColor: AppColors.primaryBackground
    ),
    BottomNavigationBarItem(
      icon: Icon(Iconfont.tag, color: AppColors.tabBarElement),
      title: Text("tag"),
      activeIcon: Icon(Iconfont.tag, color: AppColors.secondaryElementText),
      backgroundColor: AppColors.primaryBackground
    ),
    BottomNavigationBarItem(
      icon: Icon(Iconfont.me, color: AppColors.tabBarElement),
      title: Text("my"),
      activeIcon: Icon(Iconfont.me, color: AppColors.secondaryElementText),
      backgroundColor: AppColors.primaryBackground
    ),
  ];

  void _handleTabBarChange(int index) {
    _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
  }

  void _handlePageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  AppBar _buildAppBar() {
    return transparentAppBar(
      context: context,
      title: Text(
        _tabTitles[_page],
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: dusetFontSize(16),
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600
        ),
      ),
      leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.primaryText,), onPressed: () {
        Navigator.of(context).pop();
      }),
      actions: [
        IconButton(icon: Icon(Icons.search, color: AppColors.primaryText), onPressed: () {})
      ]
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        TagPage(),
        MyPage(),
      ],
      onPageChanged: _handlePageChange,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: BottomNavigationBar(items: _list),
    );
  }
}