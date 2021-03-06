import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/goldGraphSreen/components/Head.dart';
import 'package:learnUI/screens/goldGraphSreen/components/Body.dart';

class GoldGraphScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Grafik Emas",
                textScaleFactor: 1.0,
                style: TextStyle(fontFamily: "MetroBold"),
              ),
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Color(background),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Head(),
            Body(),
          ],
        ),
      ),
    );
  }
}
