import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pixie/Screens/Open/components/background.dart';
import 'package:pixie/api/api.dart';
import 'package:pixie/components/rounded_button.dart';
import 'package:pixie/constants.dart';
import 'package:pixie/models/report.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  bool checkEmpty1 = true;
  bool checkEmpty2 = true;
  bool checkEmpty3 = true;
  bool checkEmpty4 = true;
  bool checkEmpty5 = true;
  bool checkEmpty6 = true;

  Report rp = Report(
    email: "",
    key: "0",
    username: "",
    telno: "",
    content: "",
    citizengroup: "10",
    pointX: "0",
    pointY: "0",
    rtn_addr: "",
    upfile: "",
    upfile2: "0",
    upfile3: "0",
    citizen_img_wdate: "",
    citizen_img_wdate2: "0",
    citizen_img_wdate3: "0",
    device: "pixie",
  );

  Future<String> getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? account = prefs.getString('account');

    if (account != null) {
      return account;
    }
    return "";
  }

  void func() {
    getAccount().then((value) {
      setState(() {
        rp.email = value;
      });
    });
  }

  void uploadReport(BuildContext context) {
    final reportP = Provider.of<ReportProvider>(context, listen: false);
    if ((!checkEmpty1) &&
        (!checkEmpty2) &&
        (!checkEmpty3) &&
        (!checkEmpty4) &&
        (!checkEmpty5) &&
        (!checkEmpty6)) {
      reportP.addReport(rp);
      Fluttertoast.showToast(
          msg: "무단 투기가 신고되었습니다.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "빈칸을 채워주세요.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    func();
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("OpenAPI 이용 신고"),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
            SizedBox(height: size.height * 0.01),
            Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(top: size.height * 0.01),
                alignment: Alignment.centerLeft,
                child: Text(
                  "신고자명",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: new ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300.0,
                ),
                child: TextField(
                  onChanged: (value) {
                    if (value.compareTo("") == 0) {
                      setState(() {
                        checkEmpty1 = true;
                      });
                    } else {
                      setState(() {
                        checkEmpty1 = false;
                        rp.username = value;
                      });
                    }
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "",
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),
            ),
            Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(top: size.height * 0.01),
                alignment: Alignment.centerLeft,
                child: Text(
                  "신고자 전화번호",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: new ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300.0,
                ),
                child: TextField(
                  onChanged: (value) {
                    if (value.compareTo("") == 0) {
                      setState(() {
                        checkEmpty2 = true;
                      });
                    } else {
                      setState(() {
                        checkEmpty2 = false;
                        rp.telno = value;
                      });
                    }
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "",
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),
            ),
            Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(top: size.height * 0.01),
                alignment: Alignment.centerLeft,
                child: Text(
                  "신고내용",
                  maxLines: 5,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: new ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300.0,
                ),
                child: TextField(
                  onChanged: (value) {
                    if (value.compareTo("") == 0) {
                      setState(() {
                        checkEmpty3 = true;
                      });
                    } else {
                      setState(() {
                        checkEmpty3 = false;
                        rp.content = value;
                      });
                    }
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "",
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),
            ),
            Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(top: size.height * 0.01),
                alignment: Alignment.centerLeft,
                child: Text(
                  "신고위치 주소",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: new ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300.0,
                ),
                child: TextField(
                  onChanged: (value) {
                    if (value.compareTo("") == 0) {
                      setState(() {
                        checkEmpty4 = true;
                      });
                    } else {
                      setState(() {
                        checkEmpty4 = false;
                        rp.rtn_addr = value;
                      });
                    }
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "",
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),
            ),
            Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(top: size.height * 0.01),
                alignment: Alignment.centerLeft,
                child: Text(
                  "신고이미지",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: new ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300.0,
                ),
                child: TextField(
                  onChanged: (value) {
                    if (value.compareTo("") == 0) {
                      setState(() {
                        checkEmpty5 = true;
                      });
                    } else {
                      setState(() {
                        checkEmpty5 = false;
                        rp.upfile = value;
                      });
                    }
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "",
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),
            ),
            Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(top: size.height * 0.01),
                alignment: Alignment.centerLeft,
                child: Text(
                  "신고이미지 촬영일",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: new ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300.0,
                ),
                child: TextField(
                  onChanged: (value) {
                    if (value.compareTo("") == 0) {
                      setState(() {
                        checkEmpty6 = true;
                      });
                    } else {
                      setState(() {
                        checkEmpty6 = false;
                        rp.citizen_img_wdate = value;
                      });
                    }
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "",
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "등록",
              press: () {
                setState(() {
                  uploadReport(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
