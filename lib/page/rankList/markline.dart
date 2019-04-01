import 'package:flutter/material.dart';
import 'dart:convert';
import '../../service/service.dart';
import '../../model/ranklist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkLine extends StatefulWidget {
  @override
  _MarkLinePageState createState() => new _MarkLinePageState();
}

class _MarkLinePageState extends State<MarkLine>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List rankList = [];
  void initState() {
    _getRankList();
    super.initState();
  }

  void _getRankList() async {
    await getrequest('getRankList').then((val) {
      var data = json.decode(val.toString())['data'];
      RankList ranklists = RankList.fromJson(data);
      setState(() {
        rankList = ranklists.topList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: new ListView.builder(
        itemCount: rankList.length,
        itemBuilder: (BuildContext context, int index) {
          return ranklist(rankList[index]);
        },
      ),
      // child: new Text('歌手'),
    );
  }

  // 图片小部件
  Widget rankImage(data) {
    return Container(
      width: ScreenUtil().setWidth(200),
      height: ScreenUtil().setHeight(200),
      child: new Image.network(data.picUrl),
    );
  }

  // 歌单小部件
  Widget rankTitle(data, int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 5.0),
      width: ScreenUtil().setWidth(475),
      child: Text(
        '${index} ${data.songname}-${data.singername}',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
          color: Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
    );
  }

  // 图片歌单组合
  Widget ranklist(data) {
    return Container(
      padding:
          EdgeInsets.only(left: 20.0, bottom: 10.0, right: 20.0, top: 10.0),
      child: Row(
        children: <Widget>[
          rankImage(data),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              rankTitle(data.songList[0], 1),
              rankTitle(data.songList[1], 2),
              rankTitle(data.songList[2], 3),
            ],
          )
        ],
      ),
    );
  }
}
