import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/chooseBank/components/Body.dart';
import 'package:learnUI/screens/chooseBank/components/Head.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Head(),
            Body(),
          ],
        ),
      ),
    );
  }
}
