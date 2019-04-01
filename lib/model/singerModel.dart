class SingerListModel {
  int code;
  SingerData data;
  String message;
  int subcode;

  SingerListModel({this.code, this.data, this.message, this.subcode});

  SingerListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new SingerData.fromJson(json['data']) : null;
    message = json['message'];
    subcode = json['subcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['subcode'] = this.subcode;
    return data;
  }
}

class SingerData {
  List<SingerModel> list;
  int perPage;
  int total;
  int totalPage;

  SingerData({this.list, this.perPage, this.total, this.totalPage});

  SingerData.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<SingerModel>();
      json['list'].forEach((v) {
        list.add(new SingerModel.fromJson(v));
      });
    }
    perPage = json['per_page'];
    total = json['total'];
    totalPage = json['total_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_page'] = this.totalPage;
    return data;
  }
}

class SingerModel {
  String farea;
  String fattribute3;
  String fattribute4;
  String fgenre;
  String findex;
  String fotherName;
  String fsingerId;
  String fsingerMid;
  String fsingerName;
  String fsingerTag;
  String fsort;
  String ftrend;
  String ftype;
  String voc;

  SingerModel(
      {this.farea,
      this.fattribute3,
      this.fattribute4,
      this.fgenre,
      this.findex,
      this.fotherName,
      this.fsingerId,
      this.fsingerMid,
      this.fsingerName,
      this.fsingerTag,
      this.fsort,
      this.ftrend,
      this.ftype,
      this.voc});

  SingerModel.fromJson(Map<String, dynamic> json) {
    farea = json['Farea'];
    fattribute3 = json['Fattribute_3'];
    fattribute4 = json['Fattribute_4'];
    fgenre = json['Fgenre'];
    findex = json['Findex'];
    fotherName = json['Fother_name'];
    fsingerId = json['Fsinger_id'];
    fsingerMid = json['Fsinger_mid'];
    fsingerName = json['Fsinger_name'];
    fsingerTag = json['Fsinger_tag'];
    fsort = json['Fsort'];
    ftrend = json['Ftrend'];
    ftype = json['Ftype'];
    voc = json['voc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Farea'] = this.farea;
    data['Fattribute_3'] = this.fattribute3;
    data['Fattribute_4'] = this.fattribute4;
    data['Fgenre'] = this.fgenre;
    data['Findex'] = this.findex;
    data['Fother_name'] = this.fotherName;
    data['Fsinger_id'] = this.fsingerId;
    data['Fsinger_mid'] = this.fsingerMid;
    data['Fsinger_name'] = this.fsingerName;
    data['Fsinger_tag'] = this.fsingerTag;
    data['Fsort'] = this.fsort;
    data['Ftrend'] = this.ftrend;
    data['Ftype'] = this.ftype;
    data['voc'] = this.voc;
    return data;
  }
}
