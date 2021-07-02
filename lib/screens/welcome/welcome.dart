import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/screens/sharedComponents/MyGradient.dart';

class Welcome extends StatefulWidget {
  @override
  _StateWelcome createState() => _StateWelcome();
}

class _StateWelcome extends State<Welcome> {
  late Timer _timer;
  void _autoPress() {
    _timer = new Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    // _autoPress();
    return Scaffold(
        body: Container(
      color: Color(background),
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 10, left: 0, right: 0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      child: Text(
                        "Selamat",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontFamily: "MetroBold",
                          fontSize: xl,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    GradientText(
                      child: Text(
                        "Datang",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontFamily: "MetroBold",
                          fontSize: xl,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "CC Gold hadir dalam platform digital untuk jual beli emas dengan aman. Anda dapat membeli emas kapan saja dan di mana saja",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: sm, letterSpacing: 1, height: 1.5),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
