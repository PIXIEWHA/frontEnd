import 'package:flutter/material.dart';
import 'package:pixie/Screens/Login/components/background.dart';
import 'package:pixie/Screens/Signup/signup_screen.dart';
import 'package:pixie/Screens/Main/main.dart';
import 'package:pixie/api/api.dart';
import 'package:pixie/components/already_have_an_account_acheck.dart';
import 'package:pixie/components/rounded_button.dart';
import 'package:pixie/components/rounded_input_field.dart';
import 'package:pixie/components/rounded_password_field.dart';
import 'package:pixie/models/user.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  void checkUser(UserProvider userP, User user, BuildContext context) {
    bool check = false;
    userP.fetchuser();
    for (int i = 0; i < userP.users.length; i++) {
      if ((user.email.compareTo(userP.users[i].email) == 0) &&
          (user.password.compareTo(userP.users[i].password) == 0)) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
            (Route<dynamic> route) => false);
        check = true;
        break;
      }
    }
    if (!check) {
      Fluttertoast.showToast(
          msg: "로그인 실패",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = User(username: "", email: "", password: "");
    final userP = Provider.of<UserProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                user = User(
                    username: value, email: value, password: user.password);
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                user = User(
                    username: user.username,
                    email: user.email,
                    password: value);
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                checkUser(userP, user, context);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
