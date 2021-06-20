import 'package:flutter/material.dart';
import 'package:learnUI/screens/components/Body.dart';
import 'package:learnUI/screens/components/BottomNav.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [Body(), ButtonNav()],
    ));
  }
}
