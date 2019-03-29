import 'package:azlistview/azlistview.dart';

class CityInfo extends ISuspensionBean {
  String name;
  String tagIndex;
  String namePinyin;
  String code;

  CityInfo({
    this.name,
    this.tagIndex,
    this.namePinyin,
    this.code,
  });

  CityInfo.fromJson(Map<String, dynamic> json) {
    name = json['Fsinger_name'] == null ? "" : json['Fsinger_name'];
    code = json['Fsinger_mid'] == null ? "" : json['Fsinger_mid'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'tagIndex': tagIndex,
        'namePinyin': namePinyin,
        'isShowSuspension': isShowSuspension
      };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() =>
      "CityBean {" +
      " \"name\":\"" +
      name +
      "\"" +
      ',' +
      " \"code\":\"" +
      code +
      "\"" +
      '}';
}
