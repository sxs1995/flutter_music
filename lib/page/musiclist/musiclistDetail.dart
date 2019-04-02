import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/songslistprovide.dart';

class MusicListDetail extends StatefulWidget {
  final Widget child;

  MusicListDetail({Key key, this.child}) : super(key: key);

  _MusicListDetailState createState() => _MusicListDetailState();
}

class _MusicListDetailState extends State<MusicListDetail> {
  List songsLists = [];

  @override
  void initState() {
    super.initState();
    // _getsongslist();
  }

  // https://y.gtimg.cn/music/photo_new/T001R300x300M000003LaMHm42u7qS.jpg?max_age=2592000
  // https://y.gtimg.cn/music/photo_new/T001R300x300M000.jpg?max_age=2592000
  @override
  Widget build(BuildContext context) {
    return Provide<SongsListProvide>(builder: (context, child, data) {
      if (data.singerId != '') {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                musicImage(data.singerId),
                musiclist(data.listsongs, data.singerName),
              ],
            ),
          ),
        );
      } else {
        return Container(
          child: Center(
            child: Text(
              '加载中',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0),
                decoration: TextDecoration.none,
              ),
            ),
          ),
        );
      }
    });
  }

  Widget musicImage(data) {
    if (data != null) {
      return Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(520),
            width: ScreenUtil().setWidth(750),
            child: Image.network(
              'https://y.gtimg.cn/music/photo_new/T001R300x300M000' +
                  data +
                  '.jpg?max_age=2592000',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            //方法二
            left: 188.5,
            top: 30.0,
            child: Text(
              '薛之谦',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: ScreenUtil().setSp(32),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            //方法二
            left: 15.0,
            top: 23.0,
            child: new Icon(
              Icons.chevron_left,
              size: 40,
              color: Colors.black,
            ),
          ),
        ],
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

  Widget song(songs, name) {
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
              color: Colors.white70,
            ),
          ),
          Text(
            '${name}·${songs.musicData.albumname}',
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

  Widget musiclist(songs, name) {
    return ListView.builder(
      itemCount: songs.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return song(songs[index], name);
      },
    );
  }
}
