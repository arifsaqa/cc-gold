import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/chooseBank/components/Body.dart';

class ChooseBankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Text(
              "Pilih Bank",
              style: TextStyle(fontFamily: "MetroBold"),
              textScaleFactor: 1.0,
            )),
      ),
      body: Center(child: Column(children: [Body()])),
    );
  }
}
