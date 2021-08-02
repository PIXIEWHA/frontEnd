import 'package:flutter/material.dart';
import 'package:pixie/Screens/Main/components/background.dart';
import 'package:pixie/components/rounded_button.dart';
import 'package:pixie/constants.dart';
import 'package:pixie/components/rounded_input_field.dart';
import 'package:pixie/api/api.dart';
import 'package:pixie/models/rb.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Rb rbip = Rb(rb_id: "", rb_password: "");
    final rbP = Provider.of<RbProvider>(context, listen: false);
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
            SizedBox(height: size.height * 0.5),
            RoundedInputField(
              hintText: "Raspberry Pi IP : ",
              onChanged: (value) {
                rbip = Rb(rb_id: value, rb_password: "");
              },
            ),
            RoundedButton(
              text: "연결",
              press: () {
                rbP.addRb(rbip);
              },
            ),
          ],
        ),
      ),
    );
  }
}
