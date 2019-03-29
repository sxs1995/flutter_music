class HomePageMusicListModel {
  List<HomeMusicList> list;

  HomePageMusicListModel({this.list});

  HomePageMusicListModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<HomeMusicList>();
      json['list'].forEach((v) {
        list.add(new HomeMusicList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeMusicList {
  String dissname;
  String imgurl;
  Creator creator;

  HomeMusicList({this.dissname, this.imgurl, this.creator});

  HomeMusicList.fromJson(Map<String, dynamic> json) {
    dissname = json['dissname'];
    imgurl = json['imgurl'];
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dissname'] = this.dissname;
    data['imgurl'] = this.imgurl;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    return data;
  }
}

class Creator {
  String name;

  Creator({this.name});

  Creator.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
