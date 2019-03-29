import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/service.dart';
import '../../model/homepagemusicListModel.dart';

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
    _getMusiclist();
  }

  void _getMusiclist() async {
    var reqdata = {"sin": 0, "ein": 59};
    await getrequest('getHomeMusicList', reqdata: reqdata).then((val) {
      var data = json.decode(val.toString())['data'];
      HomePageMusicListModel musiclist = HomePageMusicListModel.fromJson(data);
      setState(() {
        songlists = musiclist.list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songlists.length,
      shrinkWrap: true,
      physics:
          new NeverScrollableScrollPhysics(), //禁止listview滚动 可以解决嵌套在SingleChildScrollView的问题
      itemBuilder: (BuildContext context, int index) {
        return _musicListWidgetWidget(songlists[index]);
      },
    );
  }

  Widget _musicImage(data) {
    return Container(
      width: ScreenUtil().setWidth(150),
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
      child: Image.network(
        '${data.imgurl}',
      ),
    );
  }

  Widget _musicTitle(data) {
    return Container(
      child: Text(
        data.creator.name,
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
        data.dissname,
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
