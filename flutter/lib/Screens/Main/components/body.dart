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

// ignore: must_be_immutable
class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  Future<void> checkNull(RbProvider rbP, Rb rbip, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rbip.rb_id = prefs.getString('rb_id')!;

    if (rbip.rb_id.compareTo("") != 0) {
      rbP.addRb(rbip);
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

  Future<void> storeRb(String rb_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('rb_id', rb_id);
  }

  @override
  Widget build(BuildContext context) {
    Rb rbip = Rb(email: "", rb_id: "", rb_password: "raspberry");
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
              hintText: "Raspberry Pi IP",
              onChanged: (value) {
                rbip = Rb(
                    email: rbip.email,
                    rb_id: value,
                    rb_password: rbip.rb_password);
                storeRb(value);
              },
            ),
            RoundedButton(
              text: "등록",
              press: () {
                checkNull(rbP, rbip, context);
              },
            ),
            FutureBuilder<String>(
                future: getAccount(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    rbip.email = snapshot.data!;
                  }
                  return SizedBox(height: 0);
                })
          ],
        ),
      ),
    );
  }
}
