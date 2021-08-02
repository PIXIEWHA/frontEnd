import 'package:flutter/material.dart';
import 'package:pixie/Screens/Main/components/body.dart';
import 'package:pixie/Screens/Login/login_screen.dart';
import 'package:pixie/constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      drawer: Drawer(
          child: ListView(children: <Widget>[
        DrawerHeader(
            child: Text("User"),
            decoration: BoxDecoration(color: kPrimaryLightColor)),
        ListTile(
          title: Text("라즈베리파이 연결"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
        ListTile(
          title: Text("VIDEO 확인"),
          onTap: () {},
        ),
        ListTile(
          title:
              Text("쓰레기 무단투기 신고 https://smartreport.seoul.go.kr/w100/index.do"),
          onTap: () {},
        ),
        ListTile(
          title: Text("로그아웃"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ])),
    );
  }
}
