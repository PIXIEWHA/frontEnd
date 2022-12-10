import 'package:flutter/material.dart';
import 'package:pixie/Screens/Main/main.dart';
import 'package:pixie/Screens/Pose/pose.dart';
import 'package:pixie/Screens/Report/components/body.dart';
import 'package:pixie/Screens/Video/video.dart';
import 'package:pixie/Screens/Welcome/welcome_screen.dart';
import 'package:pixie/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportScreen extends StatelessWidget {
  Future<void> storeLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('loginStatus');
  }

  Future<String> getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? account = prefs.getString('account');
    if (account != null) {
      return account;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
      drawer: Drawer(
          child: ListView(children: <Widget>[
        Container(
          height: size.height * 0.1,
          child: DrawerHeader(
              child: FutureBuilder<String>(
                  future: getAccount(),
                  builder: (context, snapshot) {
                    return Text(snapshot.data.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20));
                  }),
              decoration: BoxDecoration(color: kPrimaryLightColor)),
        ),
        ListTile(
          title: Text("라즈베리파이 등록",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
                (Route<dynamic> route) => false);
          },
        ),
        ListTile(
          title: Text("YOLOv5 영상 확인",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => VideoScreen(),
                ),
                (Route<dynamic> route) => false);
          },
        ),
        ListTile(
          title: Text("OpenPose 영상 확인",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => PoseScreen(),
                ),
                (Route<dynamic> route) => false);
          },
        ),
        ListTile(
          title: Text("쓰레기 무단 투기 신고",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => ReportScreen(),
                ),
                (Route<dynamic> route) => false);
          },
        ),
        ListTile(
          title: Text("로그아웃",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          onTap: () {
            storeLogout();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ),
                (Route<dynamic> route) => false);
          },
        ),
      ])),
    );
  }
}
