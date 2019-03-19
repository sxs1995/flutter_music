import 'package:flutter/material.dart';
import 'config.dart';
import '../global_config.dart';
import '../util/httpUtil.dart';
import 'package:dio/dio.dart';

class SingList extends StatefulWidget {
  @override
  _SingerPageState createState() => new _SingerPageState();
}

class _SingerPageState extends State<SingList> {
  Widget _listItem(ListData list) {
    return new Container(
        margin: const EdgeInsets.only(right: 6.0),
        child: new Row(
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 5,
                child: new AspectRatio(
                    aspectRatio: 1.0 / 1.0,
                    child: new Container(
                      foregroundDecoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new NetworkImage(list.imgurl),
                          centerSlice:
                              new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                        ),
                      ),
                    ))),
            new Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new Container(
                      child: new Text(
                        list.title,
                        textAlign: TextAlign.left,
                        style:
                            new TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                  new Align(
                      alignment: Alignment.centerLeft,
                      child: new Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: new Text(
                          list.info,
                          textAlign: TextAlign.left,
                          style: new TextStyle(color: GlobalConfig.fontColor),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }

  setList() {
    List<Widget> resultList = new List();
    for (int i = 0; i < questionList.length; i++) {
      resultList.add(_listItem(questionList[i]));
    }
    return resultList;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: setList(),
      ),
    );
  }
}
