import 'package:flutter/material.dart';
import '../../global_config.dart';
import '../home/home.dart';
import '../markLine/markline.dart';
import '../singer/singer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Index extends StatefulWidget {
  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Music'),
          centerTitle: true,
          bottom: new TabBar(
            labelColor:
                GlobalConfig.dark == true ? new Color(0xFF63FDD9) : Colors.blue,
            unselectedLabelColor:
                GlobalConfig.dark == true ? Colors.white : Colors.black,
            tabs: [
              new Tab(text: "推荐"),
              new Tab(text: "歌手"),
              new Tab(text: "排行"),
            ],
          ),
        ),
        body: new TabBarView(
            children: [new Home(), new CitySelectRoute(), new MarkLine()]),

        // new TabBarView(children: [new Home(), new Singer(), new Mark()]),
      ),
    );
  }

  void initState() {
    super.initState();
  }
}
