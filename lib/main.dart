import 'package:flutter/material.dart';
import 'index/index.dart';
import 'global_config.dart';

void main() => runApp(new ZhiHu());

class ZhiHu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Music", home: new Index(), theme: GlobalConfig.themeData);
  }
}
