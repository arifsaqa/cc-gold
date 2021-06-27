import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';

final Shader linearGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment(-.5, -.5),
  colors: <Color>[Color(upperGradient), Color(lowerGradient)],
).createShader(Rect.fromPoints(Offset.zero, Offset(0, 10)));

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "Selamat Datang",
                  style: TextStyle(
                      fontFamily: "MetroBold",
                      fontSize: xl,
                      letterSpacing: 1,
                      foreground: Paint()..shader = linearGradient),
                ),
              )),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "CC Gold hadir dalam platform digital untuk jual beli emas dengan aman. Anda dapat membeli emas kapan saja dan di mana saja",
              style: TextStyle(fontSize: sm, letterSpacing: 1, height: 1.5),
            ),
          )
        ],
      ),
    ));
  }
}
