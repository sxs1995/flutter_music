import 'package:flutter/material.dart';
import '../home/config.dart';

class Singer extends StatefulWidget {
  @override
  _SingerPageState createState() => new _SingerPageState();
}

class _SingerPageState extends State<Singer> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Text('歌手'),
          new FloatingActionButton(
            onPressed: () {},
          )
        ],
      ),
      // child: new Text('歌手'),
    );
  }
}
