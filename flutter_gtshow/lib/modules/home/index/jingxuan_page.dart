import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gtshow/commom/dao/home_dao.dart';
import 'package:flutter_gtshow/commom/style/text_style.dart';
import 'package:flutter_gtshow/commom/utils/asperct_radio_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/room_data.dart';

/// Created by 华惠友
/// on 2021/10/14 2:42 PM
/// description:

class JingxunaPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JingxunaPageState();
  }
}

class _JingxunaPageState extends State<JingxunaPageWidget> {
  var items = List<RoomData>();

  @override
  initState() {
    super.initState();

    HomeDao.jingxuanList(0).then((result) {
      setState(() {
        items.addAll(result);
        print("124: $result");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: GridView.builder(
          padding: EdgeInsets.all(8.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 5.w,
            mainAxisSpacing: 5.w,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => _renderItem(index),
        ),
      ),
    );
  }

  _renderItem(int index) {
    var item = items[index];
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.w),
      child: LayoutBuilder(builder: (context, contrains) {
        return Stack(children: [
          Positioned(
            child: Image.network(item.appPicUrl ?? item.picUrl),
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
          ),
          if (item.corner_v6 != null)
            Positioned(
              child: topCardWidget(item),
              height: 22.w,
              width: 200.w,
              left: 0,
              top: 8.w,
            ),
          Positioned(
            child: hotWidget(item.heat.toString()),
            top: 8.w,
            right: 10.w,
          ),
          Positioned(
            bottom: 0,
            width: contrains.maxWidth,
            height: contrains.maxHeight * 0.35,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: <Color>[
                          Colors.black.withAlpha(0),
                          Colors.black.withAlpha(170)
                        ],
                      ),
                    ),
                  ),
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                ),
                Container(
                    margin: EdgeInsets.only(left: 8.w, bottom: 8.w, right: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (item.position != null)
                          Text(item.position.city + item.position.province,
                              style: GTTextStyle.regularTextStyle(
                                  color: Colors.white.withAlpha(170),
                                  fontSize: 13)),
                        Text(item.nickName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GTTextStyle.mediumTextStyle(
                                color: Colors.white, fontSize: 14))
                      ],
                    ))
              ],
            ),
          )
        ]);
      }),
    );
  }

  Widget topCardWidget(RoomData roomData) {
    return Container(
      child: Stack(
        children: [
          Positioned(
              child: Image.network(
                roomData.corner_v6.left_img,
                width: 8,
                fit: BoxFit.fill,
              ),
              left: 0,
              top: 0,
              bottom: 0),
          Positioned(
            child: Image.network(
              roomData.corner_v6.middle_img,
              width: 70,
              fit: BoxFit.fill,
            ),
            left: 8,
            top: 0,
            bottom: 0,
          ),
          Positioned(
            child: Image.network(
              roomData.corner_v6.right_img,
              width: 8,
              fit: BoxFit.fill,
            ),
            left: 78,
            top: 0,
            bottom: 0,
          ),
          Positioned(
            child: Text(roomData.corner_v6.text,
                style: GTTextStyle.regularTextStyle(
                    color: Colors.white, fontSize: 13),
                textAlign: TextAlign.center),
            left: 8,
            top: 0,
            width: 70,
            bottom: 0,
          ),
        ],
      ),
    );
  }

  Widget hotWidget(text) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: Container(
          height: 20.w,
          color: Colors.black.withAlpha(55),
          padding: EdgeInsets.only(left: 4, right: 6),
          child: Wrap(
            spacing: 4,
            alignment: WrapAlignment.center,
            children: [
              Image(
                image: AssetImage(
                    "static/images/index/gt_componentkit_heat_icon.png"),
                alignment: Alignment.center,
              ),
              Text(text,
                  style: GTTextStyle.mediumTextStyle(
                      color: Colors.white, fontSize: 13))
            ],
          ),
        ));
  }
}
