import 'package:flutter/material.dart';
import 'package:learnUI/screens/chooseBank/components/Body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Body(),
          ],
        ),
      ),
    );
  }
}
