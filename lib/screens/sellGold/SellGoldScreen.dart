import 'package:flutter/material.dart';
import 'package:learnUI/screens/sellGold/components/Body.dart';
import 'package:learnUI/screens/sellGold/components/Head.dart';

class SellGoldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [Head(), Center(child: Body())],
        ),
      ),
    );
  }
}
