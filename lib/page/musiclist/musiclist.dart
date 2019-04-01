import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/service.dart';
import '../../model/songslist.dart';

class MusicListDetail extends StatefulWidget {
  final Widget child;

  MusicListDetail({Key key, this.child}) : super(key: key);

  _MusicListDetailState createState() => _MusicListDetailState();
}

class _MusicListDetailState extends State<MusicListDetail> {
  List songsLists = [];
  SongsListModel singerNews;

  @override
  void initState() {
    super.initState();
    _getsongslist();
  }

  void _getsongslist() async {
    await getrequest('getSongslist').then((val) {
      var data = json.decode(val.toString())['data'];
      SongsListModel songslist = SongsListModel.fromJson(data);
      print('>>>>>>>>${data}');
      print(songslist.list[0].musicData.albumname);
      setState(() {
        songsLists = songslist.list;
        singerNews = songslist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            musicImage(singerNews),
            musiclist(songsLists),
          ],
        ),
      ),
    );
  }

  Widget musicImage(data) {
    if (data != null) {
      return Container(
        height: ScreenUtil().setHeight(520),
        width: ScreenUtil().setWidth(750),
        child: Image.network(
          'https://y.gtimg.cn/music/photo_new/T001R300x300M000${data.singerMid}.jpg?max_age=2592000',
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Text(
            '加载中...',
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0),
              decoration: TextDecoration.none,
            ),
          ),
        ),
      );
    }
  }

  Widget song(songs) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${songs.musicData.songname}',
            textAlign: TextAlign.left,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: ScreenUtil().setSp(28),
              color: Colors.white,
            ),
          ),
          Text(
            '${singerNews.singerName}·${songs.musicData.albumname}',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: ScreenUtil().setSp(28),
              color: Color.fromRGBO(255, 255, 255, 0.3),
            ),
          )
        ],
      ),
    );
  }

  Widget musiclist(songs) {
    return ListView.builder(
      itemCount: songs.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return song(songs[index]);
      },
    );
  }
}
