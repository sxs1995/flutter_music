import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'config.dart';
import '../global_config.dart';

class MusicList extends StatelessWidget {
  ListData list;

  MusicList(this.list);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(right: 6.0),
        child: new Row(
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 5,
                child: new AspectRatio(
                    aspectRatio: 1.0 / 1.0,
                    child: new Container(
                      foregroundDecoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new NetworkImage(list.imgurl),
                          centerSlice:
                              new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                        ),
                      ),
                    ))),
            new Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new Container(
                      child: new Text(
                        list.dissname,
                        textAlign: TextAlign.left,
                        style:
                            new TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                  new Align(
                      alignment: Alignment.centerLeft,
                      child: new Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: new Text(
                          list.dissname,
                          textAlign: TextAlign.left,
                          style: new TextStyle(color: GlobalConfig.fontColor),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<Home> {
  List images;
  List musicList;

  @override
  void initState() {
    super.initState();
    _getHttp();
    _getmusicList();
  }

  void _getHttp() async {
    try {
      Response response = await Dio().get(
          "https://c.y.qq.com/musichall/fcgi-bin/fcg_yqqhomepagerecommend.fcg?g_tk=1928093487&inCharset=utf-8&outCharset=utf-8&notice=0&format=jsonp&platform=h5&uin=0&needNewCode=1");
      if (response.statusCode == 200) {
        List data = json.decode(response.data)['data']['slider'];
        setState(() {
          images = data.map((json) => ImageData.fromJson(json)).toList();
        });
      } else {
        print("err code $response.statusCode");
      }
    } catch (e) {
      print(e);
    }
  }

  void _getmusicList() async {
    Options options = Options(headers: {
      HttpHeaders.refererHeader: 'https://c.y.qq.com/',
      HttpHeaders.hostHeader: 'c.y.qq.com'
    });
    try {
      Response response = await Dio().get(
          'https://c.y.qq.com/splcloud/fcgi-bin/fcg_get_diss_by_tag.fcg?g_tk=1928093487&inCharset=utf-8&outCharset=utf-8&notice=0&format=json&platform=yqq&hostUin=0&sin=0&ein=29&sortId=5&needNewCode=0&categoryId=10000000&rnd=0.9121797017929849',
          options: options);
      if (response.statusCode == 200) {
        List discList = json.decode(response.data)['data']['list'];
        setState(() {
          musicList = discList.map((json) => ListData.fromJson(json)).toList();
        });
        print(discList);
      } else {
        print("err code $response.statusCode");
      }
    } catch (e) {}
  }

  // 热门歌单推荐标题
  Widget titleCard() {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Text(
        '热门歌单推荐',
        style: new TextStyle(
            color: new Color(0xFF63FDD9),
            fontSize: 14.0,
            fontWeight: FontWeight.w800),
      ),
    );
  }

  // 循环歌单列表
  setList() {
    List<Widget> resultList = new List();
    for (int i = 0; i < musicList.length; i++) {
      resultList.add(MusicList(musicList[i]));
    }
    return resultList;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new SingleChildScrollView(
      child: new Container(
        child: new Column(
          children: <Widget>[
            // 轮播图
            new Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return (Image.network(
                      images != null ? images[index].picUrl : '',
                      fit: BoxFit.fill,
                    ));
                  },
                  itemCount: images != null ? images.length : 5,
                  pagination: new SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                    color: Colors.black54,
                    activeColor: Colors.white,
                  )),
                  // control: new SwiperControl(),  //翻页按钮
                  scrollDirection: Axis.horizontal,
                  autoplay: true,
                  onTap: (index) => print('点击了第$index个'),
                )),
            titleCard(),
            new Column(
              children: setList(),
            )
          ],
        ),
      ),
    ));
  }
}
