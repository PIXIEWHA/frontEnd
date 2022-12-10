import 'package:flutter/material.dart';
import 'package:pixie/Screens/Main/components/background.dart';
import 'package:pixie/Screens/Open/open_screen.dart';
import 'package:pixie/components/rounded_button.dart';
import 'package:pixie/constants.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  void launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "url을 열 수 없습니다.";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("쓰레기 무단 투기 신고"),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
            SizedBox(height: size.height * 0.15),
            RoundedButton(
              text: "OpenAPI 이용 신고",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OpenScreen()),
                );
              },
            ),
            RoundedButton(
              text: "스마트서울 무단투기신고 어플 다운로드",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                launchURL("https://smartreport.seoul.go.kr/w100/w143.do");
              },
            ),
            RoundedButton(
              text: "스마트서울 무단투기신고 사이트",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                launchURL("https://smartreport.seoul.go.kr/w100/w150.do");
              },
            ),
            RoundedButton(
              text: "서울시 자치구 사이트",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                launchURL("https://www.seoul.go.kr/seoul/autonomy.do");
              },
            ),
          ],
        ),
      ),
    );
  }
}
