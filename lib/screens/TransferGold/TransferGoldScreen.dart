import 'package:flutter/material.dart';
import 'package:learnUI/screens/TransferGold/components/Head.dart';
import 'package:learnUI/screens/TransferGold/components/Body.dart';

class TransferGold extends StatelessWidget {
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
