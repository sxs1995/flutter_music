import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:azlistview/azlistview.dart';
import 'package:lpinyin/lpinyin.dart';
import 'city_model.dart';
import '../../model/singerModel.dart';
import '../../service/service.dart';
import '../musiclist/musiclist.dart';
import 'package:provide/provide.dart';
import '../../provide/singerlistprovide.dart';

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
  List<CityInfo> singerList = List();

  int _suspensionHeight = 40;
  int _itemHeight = 50;
  String _suspensionTag = "";

  @override
  void initState() {
    _getSingerList();
    super.initState();
  }

  // 获取歌手数据
  void _getSingerList() async {
    await getrequest('getSingelist').then((val) {
      var data = json.decode(val.toString())['data'];
      SingerData ranklists = SingerData.fromJson(data);
      ranklists.list.forEach((val) {
        singerList.add(CityInfo(name: val.fsingerName, code: val.fsingerMid));
      });
      _handleList(singerList);
      // 利用provide进行状态管理
      Provide.value<SingerListProvide>(context).getSingerList(singerList);
    });
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
    SuspensionUtil.sortListBySuspensionTag(list);
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

  //歌手图片
  Widget singerImage(model) {
    return new Container(
      padding: const EdgeInsets.only(left: 10.0),
      child: new CircleAvatar(
        backgroundImage: new NetworkImage(
            'https://y.gtimg.cn/music/photo_new/T001R300x300M000' +
                model.code +
                '.jpg?max_age=2592000'),
      ),
    );
  }

  // 歌手名字
  Widget singerName(model) {
    return new Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: new Text(
        model.name,
      ),
    );
  }

  // 单个歌手列表
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
          child: InkWell(
            onTap: () {
              print(model.name);
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new MusicListDetail(),
                ),
              );
            },
            child: new Row(
              children: <Widget>[
                singerImage(model),
                singerName(model),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<SingerListProvide>(builder: (context, child, data) {
      if (data.singerList.length != 0) {
        return Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: AzListView(
                data: data.singerList,
                itemBuilder: (context, model) => _buildListItem(model),
                suspensionWidget: _buildSusWidget(_suspensionTag),
                isUseRealIndex: true,
                itemHeight: _itemHeight,
                suspensionHeight: _suspensionHeight,
                onSusTagChanged: _onSusTagChanged,
              ),
            ),
          ],
        );
      } else {
        return Container(
          child: Center(
            child: Text('加载中...'),
          ),
        );
      }
    });
  }
}
