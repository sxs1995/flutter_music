import 'package:flutter/material.dart';
import 'carousel.dart'; //轮播图
import 'musicList.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // 热门歌单推荐标题
  Widget titleCard() {
    return new Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 5.0),
      padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
      child: new Text(
        '热门歌单推荐',
        style: new TextStyle(
          color: new Color(0xFF63FDD9),
          fontSize: 14.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          child: new Column(
            children: <Widget>[
              // 轮播图
              Carousel(),
              titleCard(),
              MusicListWidget()
            ],
          ),
        ),
      ),
    );
  }
}
