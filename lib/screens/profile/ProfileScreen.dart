import 'package:flutter/material.dart';
import 'package:learnUI/screens/profile/components/Body.dart';
import 'package:learnUI/screens/profile/components/Head.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [Head(), Body()],
      ),
    );
  }
}
