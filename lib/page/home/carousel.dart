import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/service.dart';
import 'dart:convert';

class Carousel extends StatelessWidget {
  final List swiperDataList;

  Carousel({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      child: FutureBuilder(
        future: getHomePageCarousel(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            List<Map> swiper = (data['data']['slider'] as List).cast();
            return _swiperWidget(swiper);
          } else {
            return Center(
              child: Text('加载中...'),
            );
          }
        },
      ),
    );
  }

  Widget _swiperWidget(swiper) {
    return Swiper(
      itemCount: swiper.length,
      autoplay: true,
      pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          '${swiper[index]["picUrl"]}',
          fit: BoxFit.fill,
        );
      },
    );
  }
}
