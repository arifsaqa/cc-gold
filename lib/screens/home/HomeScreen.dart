import 'package:flutter/material.dart';
import 'package:learnUI/screens/home/components/Body.dart';
import 'package:learnUI/screens/home/components/Head.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Head(),
          Body(),
        ],
      ),
    );
  }
}
