import 'dart:io';

class Report {
  String key;
  String username;
  String telno;
  String content;
  String citizengroup;
  String pointX;
  String pointY;
  String rtn_addr;
  File upfile;
  File upfile2;
  File upfile3;
  String citizen_img_wdate;
  String citizen_img_wdate2;
  String citizen_img_wdate3;
  String device;

  Report(
      {required this.key,
      required this.username,
      required this.telno,
      required this.content,
      required this.citizengroup,
      required this.pointX,
      required this.pointY,
      required this.rtn_addr,
      required this.upfile,
      required this.upfile2,
      required this.upfile3,
      required this.citizen_img_wdate,
      required this.citizen_img_wdate2,
      required this.citizen_img_wdate3,
      required this.device});

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      key: json['key'],
      username: json['username'],
      telno: json['telno'],
      content: json['content'],
      citizengroup: json['citizengroup'],
      pointX: json['pointX'],
      pointY: json['pointY'],
      rtn_addr: json['rtn_addr'],
      upfile: json['upfile'],
      upfile2: json['upfile2'],
      upfile3: json['upfile3'],
      citizen_img_wdate: json['citizen_img_wdate'],
      citizen_img_wdate2: json['citizen_img_wdate2'],
      citizen_img_wdate3: json['citizen_img_wdate3'],
      device: json['device'],
    );
  }
  dynamic toJson() => {
        "key": key,
        "username": username,
        "telno": telno,
        "content": content,
        "citizengroup": citizengroup,
        "pointX": pointX,
        "pointY": pointY,
        "rtn_addr": rtn_addr,
        "upfile": upfile,
        "upfile2": upfile2,
        "upfile3": upfile3,
        "citizen_img_wdate": citizen_img_wdate,
        "citizen_img_wdate2": citizen_img_wdate2,
        "citizen_img_wdate3": citizen_img_wdate3,
        "device": device
      };
}
