// 轮播图
class ImageData {
  final int id;
  final String linkUrl;
  final String picUrl;

  ImageData({
    this.id,
    this.linkUrl,
    this.picUrl,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'] as int,
      linkUrl: json['linkUrl'] as String,
      picUrl: json['picUrl'] as String,
    );
  }
}

// 歌单列表
class ListData {
  final String imgurl;
  final String dissname;
  final String creator;
  ListData({
    this.creator,
    this.imgurl,
    this.dissname,
  });

  factory ListData.fromJson(Map<String, dynamic> json) {
    return ListData(
      creator: json['dissname'],
      imgurl: json['imgurl'] as String,
      dissname: json['dissname'] as String,
    );
  }
}

// 歌手列表
class SingerList {
  final String fsingermid;
  final String name;
  final String tagIndex;
  final String namePinyin;
  SingerList({
    this.fsingermid,
    this.name,
    this.tagIndex,
    this.namePinyin,
  });

  factory SingerList.fromJson(Map<String, dynamic> json) {
    return SingerList(
      fsingermid: json['Fsinger_mid'] as String,
      name: json['Fsinger_name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'tagIndex': tagIndex,
        'namePinyin': namePinyin,
      };
  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => "CityBean {" + " \"name\":\"" + name + "\"" + '}';
}
