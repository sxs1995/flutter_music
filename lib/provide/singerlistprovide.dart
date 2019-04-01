import 'package:flutter/material.dart';
import '../page/singer/city_model.dart';

class SingerListProvide with ChangeNotifier {
  List<CityInfo> singerList = [];

  getSingerList(List<CityInfo> list) {
    singerList = list;
    notifyListeners();
  }
}
