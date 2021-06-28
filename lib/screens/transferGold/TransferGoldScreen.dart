import 'package:flutter/material.dart';
import 'package:learnUI/screens/transferGold/components/Head.dart';
import 'package:learnUI/screens/transferGold/components/Body.dart';

class transferGold extends StatelessWidget {
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
