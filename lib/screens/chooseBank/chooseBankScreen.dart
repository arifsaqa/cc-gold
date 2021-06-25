import 'package:flutter/material.dart';
import 'package:learnUI/screens/chooseBank/components/Body.dart';
import 'package:learnUI/screens/chooseBank/components/Head.dart';

class ChooseBankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
