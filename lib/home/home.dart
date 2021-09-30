import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gtshow/commom/style/gt_style.dart';
import 'package:flutter_gtshow/focus/focus.dart';
import 'package:flutter_gtshow/message/message.dart';
import 'package:flutter_gtshow/my/my.dart';
import 'package:flutter_gtshow/near/near.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  ScrollController _scrollController = ScrollController();
  PageController _pageController = PageController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //点击悬浮标回到顶部
  _indexPageScrollTop() {
    _scrollController.animateTo(.0,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(msg: '再按一次退出App');
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
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
                      ? _bottomIcon('images/nav/nav-12.jpg')
                      : _bottomIcon('images/nav/nav-11.jpg')),
              BottomNavigationBarItem(
                  label: _bottomNavList[1],
                  icon: _currentIndex == 1
                      ? _bottomIcon('images/nav/nav-22.jpg')
                      : _bottomIcon('images/nav/nav-21.jpg')),
              BottomNavigationBarItem(
                  label: _bottomNavList[2],
                  icon: _currentIndex == 2
                      ? _bottomIcon('images/nav/nav-42.jpg')
                      : _bottomIcon('images/nav/nav-41.jpg')),
              BottomNavigationBarItem(
                  label: _bottomNavList[3],
                  icon: _currentIndex == 3
                      ? _bottomIcon('images/nav/nav-32.jpg')
                      : _bottomIcon('images/nav/nav-31.jpg')),
              BottomNavigationBarItem(
                  label: _bottomNavList[4],
                  icon: _currentIndex == 4
                      ? _bottomIcon('images/nav/nav-52.jpg')
                      : _bottomIcon('images/nav/nav-51.jpg')),
            ]
        ),
        body: _currentPage(),
      ),
    );
  }

  // 底部导航对应的页面
  Widget _currentPage() {
    var _pages = [
      GTHomePage(),
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
          path,
          width: 25.w,
          height: 25.w,
          repeat:ImageRepeat.noRepeat,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        )
    );
  }
}










