import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.035),
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          child,
        ],
      ),
    );
  }
}
