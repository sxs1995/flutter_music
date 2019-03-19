import 'package:flutter/material.dart';

class Mark extends StatefulWidget {
  @override
  _MarkPageState createState() => new _MarkPageState();
}

class _MarkPageState extends State<Mark> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Text('排行'),
      ),
    );
  }
}
