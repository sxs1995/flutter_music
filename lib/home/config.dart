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
  final Object creator;
  ListData({
    this.creator,
    this.imgurl,
    this.dissname,
  });

  factory ListData.fromJson(Map<String, dynamic> json) {
    return ListData(
      creator: json['creator'] as Object,
      imgurl: json['imgurl'] as String,
      dissname: json['dissname'] as String,
    );
  }
}

// List<ListData> questionList = [
//   new ListData(
//       "http://p.qpic.cn/music_cover/FBicu030Yo6HCiavRCRg0vJEiblN1vMnibrrDkDO5JP4SIpBL2NibeVmVKw/600?n=1",
//       "夏目杏林",
//       "下午茶的清甜香：无损法语"),
//   new ListData(
//       "http://p.qpic.cn/music_cover/fPn0iapLleUFx4kZhMPupPt7gPa0PLAAWDJsNCnrDAqfoPgJ23YB5tA/600?n=1",
//       "穿着皮鞋跳大神",
//       "复古Funk | 烫个爆炸头然后跳舞吧！"),
//   new ListData(
//       "http://p.qpic.cn/music_cover/VnA9cLsBD4vVqc6MvXaL2hjo1B3BDV9Wic0RxO3O747ic3icibn1Gz6CsQ/600?n=1",
//       "嗞嗞唷",
//       "交响曲：器乐的戏剧和冲突"),
//   new ListData(
//       "http://p.qpic.cn/music_cover/Fe6emiag6IuVbMib3oN6yctZVyXYaLLguMpabepSAibEgw2ZK9b793wPA/600?n=1",
//       "就是一个听歌der",
//       "心情调味剂 · 这些歌有点小俏皮"),
//   new ListData(
//       "http://p.qpic.cn/music_cover/J64RvyhQtdjd9bWzGSbsoAm50gJqNbpj56PUFGuKPQaiaGiccm0PDNEA/600?n=1",
//       "一阵春风",
//       "氛围电子 ：错位空间里的冥想"),
// ];
