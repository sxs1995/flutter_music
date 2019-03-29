import 'package:flutter/material.dart';
import '../home/config.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';

class MarkLine extends StatefulWidget {
  @override
  _MarkLinePageState createState() => new _MarkLinePageState();
}

class Marksadawbhdqh extends StatelessWidget {
  Paihang markt;

  Marksadawbhdqh(this.markt);

  @override
  Widget build(BuildContext context) {
    // print(markt.songList);
    return new Container(
      padding: const EdgeInsets.only(
          left: 20.0, bottom: 10.0, right: 20.0, top: 10.0),
      child: new Row(
        children: <Widget>[
          new Container(
            width: 100.0,
            height: 100.0,
            child: new Image.network(markt != null ? markt.picUrl : ''
                // markList != null ? markList[index].picUrl : '',
                ),
          ),
          new Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  '1 绿色-陈雪凝',
                  style: TextStyle(fontSize: 16.0, height: 1),
                ),
                new Text(
                  '1 绿色-陈雪凝',
                  style: TextStyle(fontSize: 16.0, height: 1.4),
                ),
                new Text(
                  '1 绿色-陈雪凝',
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MarkLinePageState extends State<MarkLine> {
  List markList;
  void initState() {
    _getmusicList();
    super.initState();
  }

  void _getmusicList() async {
    Options options = Options(headers: {
      HttpHeaders.refererHeader: 'https://c.y.qq.com/',
      HttpHeaders.hostHeader: 'c.y.qq.com'
    });
    try {
      Response response = await Dio().get(
          'https://c.y.qq.com/v8/fcg-bin/fcg_myqq_toplist.fcg?g_tk=999222372&inCharset=utf-8&outCharset=utf-8&notice=0&format=json&platform=h5&uin=0&needNewCode=1',
          options: options);
      if (response.statusCode == 200) {
        List discList = json.decode(response.data)['data']['topList'];
        setState(() {
          markList = discList.map((json) => Paihang.fromJson(json)).toList();
        });
      } else {
        print("err code $response.statusCode");
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemCount: 14,
        itemBuilder: (BuildContext context, int index) {
          return Marksadawbhdqh(markList != null ? markList[index] : '');
        },
      ),
      // child: new Text('歌手'),
    );
  }
}
