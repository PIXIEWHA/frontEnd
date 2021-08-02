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
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: size.height * 0.2,
              left: size.width * 0.2,
              child: Image.asset(
                "assets/images/pixie_logo.png",
                width: size.width * 0.6,
              )),
          child,
        ],
      ),
    );
  }
}
