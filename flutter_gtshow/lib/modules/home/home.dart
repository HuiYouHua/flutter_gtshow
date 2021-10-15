import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gtshow/commom/style/colors_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'focus/focus.dart';
import 'index/index.dart';
import 'message/message.dart';
import 'my/my.dart';
import 'near/near.dart';

/// Created by 华惠友
/// on 2021/9/30 2:59 PM
/// description: 

class GTHomePage extends StatefulWidget {
  GTHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _GTHomePageState createState() => _GTHomePageState();
}

class _GTHomePageState extends State<GTHomePage> {

  final _bottomNavList = ["首页", "附近", "消息", "关注", "我的"];
  //底部导航当前页面
  int _currentIndex = 0;
  //首页整体滚动控制器
//  ScrollController _scrollController = ScrollController();
  PageController _pageController = PageController();

  @override
  void dispose() {
//    _scrollController.dispose();
    super.dispose();
  }

  //点击悬浮标回到顶部
//  _indexPageScrollTop() {
//    _scrollController.animateTo(.0,
//        duration: Duration(milliseconds: 300),
//        curve: Curves.ease);
//  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(msg: '再按一次退出App', gravity: ToastGravity.CENTER);
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: GTColors.cFF504D,
          unselectedItemColor: GTColors.c666666,
          selectedFontSize: 9.sp,
          unselectedFontSize: 9.sp,
          onTap: (index) {
            if (mounted)
              setState(() {
                _currentIndex = index;
              });
            _pageController.jumpToPage(index);
          },
            items: [
              BottomNavigationBarItem(
                  label: _bottomNavList[0],
                  icon: _currentIndex == 0
                      ? _bottomIcon('tabbar_recom_select.png')
                      : _bottomIcon('tabbar_recom_normal.png')),
              BottomNavigationBarItem(
                  label: _bottomNavList[1],
                  icon: _currentIndex == 1
                      ? _bottomIcon('tabbar_find_select.png')
                      : _bottomIcon('tabbar_find_normal.png')),
              BottomNavigationBarItem(
                  label: _bottomNavList[2],
                  icon: _currentIndex == 2
                      ? _bottomIcon('tabbar_chat_select.png')
                      : _bottomIcon('tabbar_chat_normal.png')),
              BottomNavigationBarItem(
                  label: _bottomNavList[3],
                  icon: _currentIndex == 3
                      ? _bottomIcon('tabbar_focus_select.png')
                      : _bottomIcon('tabbar_focus_normal.png')),
              BottomNavigationBarItem(
                  label: _bottomNavList[4],
                  icon: _currentIndex == 4
                      ? _bottomIcon('tabbar_mine_select.png')
                      : _bottomIcon('tabbar_mine_normal.png')),
            ]
        ),
        body: _currentPage(),
      ),
    );
  }

  // 底部导航对应的页面
  Widget _currentPage() {
    var _pages = [
      GTIndexPage(),
      GTNearPage(),
      GTMessagePage(),
      GTFocusPage(),
      GTMinePage(),
    ];

    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (context, index) => _pages[index]
    );
  }

  Widget _bottomIcon(path) {
    return Padding(
        padding: EdgeInsets.only(bottom: 4.r),
        child: Image.asset(
          'static/images/tabbar/' + path,
          width: 25.w,
          height: 25.w,
          repeat:ImageRepeat.noRepeat,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        )
    );
  }
}










