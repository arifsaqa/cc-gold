import 'package:flutter/material.dart';
import 'package:learnUI/screens/goldGraphSreen/components/Head.dart';
import 'package:learnUI/screens/goldGraphSreen/components/Body.dart';

class GoldGraphScreen extends StatelessWidget {
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
