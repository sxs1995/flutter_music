class SongsListModel {
  List<SongsList> list;
  String singerId;
  String singerMid;
  String singerName;

  SongsListModel({this.list, this.singerId, this.singerMid, this.singerName});

  SongsListModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<SongsList>();
      json['list'].forEach((v) {
        list.add(new SongsList.fromJson(v));
      });
    }
    singerId = json['singer_id'];
    singerMid = json['singer_mid'];
    singerName = json['singer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['singer_id'] = this.singerId;
    data['singer_mid'] = this.singerMid;
    data['singer_name'] = this.singerName;
    return data;
  }
}

class SongsList {
  int index;
  MusicData musicData;
  String playurl;

  SongsList({this.index, this.musicData, this.playurl});

  SongsList.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    musicData = json['musicData'] != null
        ? new MusicData.fromJson(json['musicData'])
        : null;
    playurl = json['playurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    if (this.musicData != null) {
      data['musicData'] = this.musicData.toJson();
    }
    data['playurl'] = this.playurl;
    return data;
  }
}

class MusicData {
  String albumdesc;
  int albumid;
  String albummid;
  String albumname;
  int interval;
  int sizeflac;
  int sizeogg;
  int songid;
  String songmid;
  String songname;
  String songorig;
  String strMediaMid;
  int stream;
  int type;
  String vid;

  MusicData(
      {this.albumdesc,
      this.albumid,
      this.albummid,
      this.albumname,
      this.interval,
      this.sizeflac,
      this.sizeogg,
      this.songid,
      this.songmid,
      this.songname,
      this.songorig,
      this.strMediaMid,
      this.stream,
      this.type,
      this.vid});

  MusicData.fromJson(Map<String, dynamic> json) {
    albumdesc = json['albumdesc'];
    albumid = json['albumid'];
    albummid = json['albummid'];
    albumname = json['albumname'];
    interval = json['interval'];
    sizeflac = json['sizeflac'];
    sizeogg = json['sizeogg'];
    songid = json['songid'];
    songmid = json['songmid'];
    songname = json['songname'];
    songorig = json['songorig'];
    strMediaMid = json['strMediaMid'];
    stream = json['stream'];
    type = json['type'];
    vid = json['vid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumdesc'] = this.albumdesc;
    data['albumid'] = this.albumid;
    data['albummid'] = this.albummid;
    data['albumname'] = this.albumname;
    data['interval'] = this.interval;
    data['sizeflac'] = this.sizeflac;
    data['sizeogg'] = this.sizeogg;
    data['songid'] = this.songid;
    data['songmid'] = this.songmid;
    data['songname'] = this.songname;
    data['songorig'] = this.songorig;
    data['strMediaMid'] = this.strMediaMid;
    data['stream'] = this.stream;
    data['type'] = this.type;
    data['vid'] = this.vid;
    return data;
  }
}
