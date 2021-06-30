import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/sellGold/components/Body.dart';
import 'package:learnUI/screens/sellGold/components/Head.dart';

class SellGoldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Title(
              color: Color(background),
              child: Text(
                "Jual Emas",
                textScaleFactor: 1.0,
                style: TextStyle(fontFamily: "MetroBold"),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [Head(), Body()],
          ),
        ),
      ),
    );
  }
}
