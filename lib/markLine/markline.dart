import 'package:flutter/material.dart';
import '../home/config.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';

class MarkLine extends StatefulWidget {
  @override
  _MarkLinePageState createState() => new _MarkLinePageState();
}

class _MarkLinePageState extends State<MarkLine> {
  List musicList;
  void initState() {
    super.initState();
    _getmusicList();
  }

  void _getmusicList() async {
    try {
      Response response = await Dio().get(
        'https://c.y.qq.com/v8/fcg-bin/fcg_myqq_toplist.fcg?g_tk=999222372&inCharset=utf-8&outCharset=utf-8&notice=0&format=json&platform=h5&uin=0&needNewCode=1',
      );
      if (response.statusCode == 200) {
        List discList = json.decode(response.data)['data']['topList'];
        print(discList);
        // setState(() {
        //   musicList = discList.map((json) => ListData.fromJson(json)).toList();
        // });
      } else {
        print("err code $response.statusCode");
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 100.0,
                  height: 100.0,
                  child: new Image.network(
                      'http://y.gtimg.cn/music/photo_new/T003R300x300M000002BBg0L3J1yav.jpg'),
                ),
                new Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        '1 绿色-陈雪凝',
                        style: TextStyle(fontSize: 16.0, height: 1.2),
                      ),
                      new Text(
                        '1 绿色-陈雪凝',
                        style: TextStyle(fontSize: 16.0, height: 1.2),
                      ),
                      new Text(
                        '1 绿色-陈雪凝',
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      // child: new Text('歌手'),
    );
  }
}
