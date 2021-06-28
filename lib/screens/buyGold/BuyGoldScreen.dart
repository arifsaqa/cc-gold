import 'package:flutter/material.dart';
import 'package:learnUI/screens/buyGold/components/Head.dart';
import 'package:learnUI/screens/buyGold/components/Body.dart';

class BuyGold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [Head(), Body()],
        ),
      ),
    );
  }
}
