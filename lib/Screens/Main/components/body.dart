import 'package:flutter/material.dart';
import 'package:front/Screens/Main/components/background.dart';
import 'package:front/constants.dart';
import 'package:front/components/rounded_input_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("Menu"),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
            SizedBox(height: size.height * 0.2),
            Positioned(
                child: Image.asset(
              "assets/images/raspberrypi.jpg",
              width: size.width * 0.6,
            )),
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              hintText: "Raspberry Pi IP : ",
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
