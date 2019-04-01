import 'package:flutter/material.dart';
import '../model/songslist.dart';

class SongsListProvide with ChangeNotifier {
  List<SongsList> listsongs = [];
  String singerId = '';
  String singerName = '';
  getlistsongs(List<SongsList> list, String id, String name) {
    listsongs = list;
    singerId = id;
    singerName = name;
    notifyListeners();
  }
}
