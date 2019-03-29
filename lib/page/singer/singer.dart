import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:azlistview/azlistview.dart';
import 'package:lpinyin/lpinyin.dart';
import 'city_model.dart';
import 'package:dio/dio.dart';

class CitySelectRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CitySelectRouteState();
  }
}

class _CitySelectRouteState extends State<CitySelectRoute>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<CityInfo> _cityList = List();
  List<CityInfo> _hotCityList = List();

  int _suspensionHeight = 40;
  int _itemHeight = 50;
  String _suspensionTag = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    Response response = await Dio().get(
        "https://c.y.qq.com/v8/fcg-bin/v8.fcg?g_tk=1928093487&inCharset=utf-8&outCharset=utf-8&notice=0&format=jsonp&channel=singer&page=list&key=all_all_all&pagesize=100&pagenum=1&hostUin=0&needNewCode=0&platform=yqq");
    if (response.statusCode == 200) {
      List list = json.decode(response.data)['data']['list'];
      list.forEach((value) {
        _cityList.add(
            CityInfo(name: value['Fsinger_name'], code: value['Fsinger_mid']));
      });
      _handleList(_cityList);
      setState(() {
        _suspensionTag =
            _hotCityList.length != 0 ? _hotCityList[0].getSuspensionTag() : '';
      });
    } else {
      print("err code $response.statusCode");
    }
  }

  void _handleList(List<CityInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    //根据A-Z排序
    SuspensionUtil.sortListBySuspensionTag(_cityList);
  }

  void _onSusTagChanged(String tag) {
    setState(() {
      _suspensionTag = tag;
    });
  }

  Widget _buildSusWidget(String susTag) {
    susTag = (susTag == "★" ? "热门" : susTag);
    return Container(
      height: _suspensionHeight.toDouble(),
      padding: const EdgeInsets.only(left: 15.0),
      color: Color(0xff222222),
      alignment: Alignment.centerLeft,
      child: Text(
        '$susTag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xff999999),
        ),
      ),
    );
  }

  Widget _buildListItem(CityInfo model) {
    String susTag = model.getSuspensionTag();
    susTag = (susTag == "★" ? "热门" : susTag);
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        SizedBox(
          height: _itemHeight.toDouble(),
          child: new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      'https://y.gtimg.cn/music/photo_new/T001R300x300M000' +
                          model.code +
                          '.jpg?max_age=2592000'),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: new Text(
                  model.name,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: AzListView(
              data: _cityList,
              topData: _hotCityList,
              itemBuilder: (context, model) => _buildListItem(model),
              suspensionWidget: _buildSusWidget(_suspensionTag),
              isUseRealIndex: true,
              itemHeight: _itemHeight,
              suspensionHeight: _suspensionHeight,
              // onSusTagChanged: _onSusTagChanged,
              //showCenterTip: false,
            )),
      ],
    );
  }
}
