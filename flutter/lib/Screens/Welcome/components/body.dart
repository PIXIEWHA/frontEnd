import 'package:flutter/material.dart';
import 'package:pixie/Screens/Login/login_screen.dart';
import 'package:pixie/Screens/Signup/signup_screen.dart';
import 'package:pixie/Screens/Welcome/components/background.dart';
import 'package:pixie/components/rounded_button.dart';
import 'package:pixie/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Text(
            //  "WELCOME TO PIXIE",
            //  style: TextStyle(fontWeight: FontWeight.bold),
            //),
            SizedBox(height: size.height * 0.2),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
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
