import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/buyGold/components/Head.dart';
import 'package:learnUI/screens/buyGold/components/Body.dart';

class BuyGold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Title(
              color: Color(background),
              child: Text(
                "Beli Emas",
                textScaleFactor: 1.0,
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
