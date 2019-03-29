class RankListModel {
  RankList data;

  RankListModel({this.data});

  RankListModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new RankList.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class RankList {
  List<TopList> topList;

  RankList({this.topList});

  RankList.fromJson(Map<String, dynamic> json) {
    if (json['topList'] != null) {
      topList = new List<TopList>();
      json['topList'].forEach((v) {
        topList.add(new TopList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topList != null) {
      data['topList'] = this.topList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopList {
  int id;
  int listenCount;
  String picUrl;
  List<SongList> songList;
  String topTitle;
  int type;

  TopList(
      {this.id,
      this.listenCount,
      this.picUrl,
      this.songList,
      this.topTitle,
      this.type});

  TopList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    listenCount = json['listenCount'];
    picUrl = json['picUrl'];
    if (json['songList'] != null) {
      songList = new List<SongList>();
      json['songList'].forEach((v) {
        songList.add(new SongList.fromJson(v));
      });
    }
    topTitle = json['topTitle'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['listenCount'] = this.listenCount;
    data['picUrl'] = this.picUrl;
    if (this.songList != null) {
      data['songList'] = this.songList.map((v) => v.toJson()).toList();
    }
    data['topTitle'] = this.topTitle;
    data['type'] = this.type;
    return data;
  }
}

class SongList {
  String singername;
  String songname;

  SongList({this.singername, this.songname});

  SongList.fromJson(Map<String, dynamic> json) {
    singername = json['singername'];
    songname = json['songname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['singername'] = this.singername;
    data['songname'] = this.songname;
    return data;
  }
}
