import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pixie/Screens/Main/components/background.dart';
import 'package:pixie/components/rounded_button.dart';
import 'package:pixie/constants.dart';
import 'package:pixie/components/rounded_input_field.dart';
import 'package:pixie/api/api.dart';
import 'package:pixie/models/rb.dart';
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
  bool checkEmpty = true;
  Rb rbip = Rb(email: "", rb_id: "", rb_password: "raspberry");
  String ipTemp = "";

  void func() {
    getIP().then((value) {
      setState(() {
        rbip.rb_id = value;
      });
    });
  }

  void checkNull(RbProvider rbP, Rb rbip, BuildContext context) {
    if ((!checkEmpty) && (rbip.rb_id.compareTo("") != 0)) {
      rbP.addRb(rbip);
      setState(() {
        storeRb(rbip.rb_id);
      });
      Fluttertoast.showToast(
          msg: "라즈베리파이 등록 성공",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "라즈베리파이 등록 실패",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<String> getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? account = prefs.getString('account');
    if (account != null) {
      return account;
    }
    return "";
  }

  Future<String> getIP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? rb_id = prefs.getString('rb_id');
    if (rb_id != null) {
      return rb_id;
    }
    return "";
  }

  Future<void> storeRb(String rb_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('rb_id', rb_id);
  }

  @override
  Widget build(BuildContext context) {
    func();
    final rbP = Provider.of<RbProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("라즈베리파이 등록"),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
            SizedBox(height: size.height * 0.2),
            Image.asset(
              'assets/images/raspberrypi.jpg',
              width: size.width * 0.6,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              hintText: "Raspberry IP: " + rbip.rb_id,
              onChanged: (value) {
                if (value.compareTo("") == 0) {
                  setState(() {
                    checkEmpty = true;
                  });
                } else {
                  setState(() {
                    checkEmpty = false;
                    ipTemp = value;
                  });
                }
              },
            ),
            RoundedButton(
              text: "등록",
              press: () {
                setState(() {
                  rbip.rb_id = ipTemp;
                  checkNull(rbP, rbip, context);
                });
              },
            ),
            FutureBuilder<String>(
                future: getAccount(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    rbip.email = snapshot.data!;
                  }
                  return SizedBox(height: 0);
                }),
          ],
        ),
      ),
    );
  }
}
