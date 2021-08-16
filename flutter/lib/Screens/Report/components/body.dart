import 'package:flutter/material.dart';
import 'package:pixie/Screens/Main/components/background.dart';
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
    launchURL("https://smartreport.seoul.go.kr/w100/w143.do");
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("쓰레기 무단 투기 신고"),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
