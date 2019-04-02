import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/service.dart';

class MusicListWidget extends StatefulWidget {
  final Widget child;

  MusicListWidget({Key key, this.child}) : super(key: key);

  _MusicListWidgetState createState() => _MusicListWidgetState();
}

class _MusicListWidgetState extends State<MusicListWidget> {
  List songlists = [];

  @override
  void initState() {
    super.initState();
  }

  // Future模式
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getHomePageMusicList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var data = json.decode(snapshot.data.toString());
          List<Map> musicList = (data['data']['list'] as List).cast();
          return ListView.builder(
            itemCount: musicList.length,
            shrinkWrap: true,
            physics:
                new NeverScrollableScrollPhysics(), //禁止listview滚动 可以解决嵌套在SingleChildScrollView的问题
            itemBuilder: (BuildContext context, int index) {
              return _musicListWidgetWidget(musicList[index]);
            },
          );
        } else {
          return Container(
            child: Center(
              child: Text('加载中...'),
            ),
          );
        }
      },
    );
  }

  Widget _musicImage(data) {
    return Container(
      width: ScreenUtil().setWidth(150),
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
      child: Image.network(
        '${data["imgurl"]}', //Future取值方式
      ),
    );
  }

  Widget _musicTitle(data) {
    return Container(
      child: Text(
        '${data["creator"]["name"]}', //Future取值方式
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: new TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget _musicInfo(data) {
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      child: Text(
        '${data["dissname"]}', //Future取值方式
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: TextStyle(
          color: Colors.white30,
          fontSize: ScreenUtil().setSp(26),
        ),
      ),
    );
  }

  Widget _musicListWidgetWidget(data) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Row(
          children: <Widget>[
            _musicImage(data),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _musicTitle(data),
                _musicInfo(data),
              ],
            )
          ],
        ),
      ),
    );
  }
}
