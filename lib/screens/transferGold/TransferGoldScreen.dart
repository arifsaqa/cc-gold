import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/transferGold/components/Head.dart';
import 'package:learnUI/screens/transferGold/components/Body.dart';

class transferGold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Text(
              "Transfer Emas",
              textScaleFactor: 1.0,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Head(), Body()],
        ),
      ),
    );
  }
}
