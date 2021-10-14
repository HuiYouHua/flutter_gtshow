import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gtshow/commom/dao/home_dao.dart';
import 'package:flutter_gtshow/commom/style/colors_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'jingxuan_page.dart';

/// Created by 华惠友
/// on 2021/9/30 2:59 PM
/// description:

class GTIndexPage extends StatefulWidget {
  @override
  _GTIndexPageState createState() => _GTIndexPageState();
}

class _GTIndexPageState extends State<GTIndexPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List tabs = ['精选', 'PK', '脱口秀', '舞蹈', '女神', '音乐', '星秀']; // 顶部导航栏

  TabController tabController; // 导航栏切换Controller

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          bottom: buildTabBar(),
          centerTitle: true,
          brightness: Brightness.dark,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[GTColors.cFF5D7E, GTColors.cFF504D],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(49),
      ),
      body: buildBodyView(),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  buildBodyView() {
    Widget tabBarBodyView = TabBarView(
      controller: tabController,
      //创建Tab页
      children: tabs
          .asMap()
          .map((i, e)
    {
      if (i == 0) {
        return MapEntry(0, JingxunaPageWidget());
      } else {
        return MapEntry(
      i,
      Container(
        alignment: Alignment.center,
        child: Text(e, textScaleFactor: 1),)
        );
      }
      }).values.toList(),
    );
    return tabBarBodyView;
  }

  buildTabBar() {
    Widget tabBar = AppBarComponent(tabs: tabs, tabController: tabController);

    return tabBar;
  }
}

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final List tabs;

  final TabController tabController;

  AppBarComponent({@required this.tabs, this.tabController});

  @override
  Size get preferredSize {
    return Size.fromHeight(44);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          children: [
      Container(
        margin: EdgeInsets.only(left: 16.w),
        width: 24.w,
        height: 24.w,
          child: MaterialButton(
            padding: EdgeInsets.zero,
              child: Image(
                image: AssetImage("static/images/index/home_top_search_icon.png"),
              ),
              onPressed: () => {
              Fluttertoast.showToast(msg: '搜索', gravity: ToastGravity.CENTER),
        },
      ),
      ),
          Expanded(
            flex: 1,
            child: TabBar(
              isScrollable: true,
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
              ),
              labelStyle: TextStyle(
                fontSize: 20,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorWeight: 3.w,
              indicatorSize: TabBarIndicatorSize.label,
              controller: tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList(),
            ),
          ),
    Container(
    margin: EdgeInsets.only(left: 16.w ,right: 16.w),
    width: 24.w,
    height: 24.w,
    child: MaterialButton(
    padding: EdgeInsets.zero,
    child: Image(
    image: AssetImage("static/images/index/home_top_more_icon.png"),
    ),
    onPressed: () => {
    Fluttertoast.showToast(msg: '更多', gravity: ToastGravity.CENTER),
    },
    ),
    ),
        ],
      ),
    );
  }
}
