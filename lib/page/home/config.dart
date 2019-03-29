class Song {
  final String singername;
  final String songname;
  Song({
    this.singername,
    this.songname,
  });
}

//排行
class Paihang {
  final String picUrl;
  // final List<Song> songList;
  Paihang({
    this.picUrl,
    // this.songList,
  });

  factory Paihang.fromJson(Map<String, dynamic> json) {
    return Paihang(
      picUrl: json['picUrl'] as String,
      // songList: json['songList'] as List<Song>,
    );
  }
}
