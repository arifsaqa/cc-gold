import 'package:flutter/material.dart';
import 'package:learnUI/screens/profile/components/Body.dart';
import 'package:learnUI/screens/profile/components/Head.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        child: Column(
          children: [Head(), Body()],
        ),
      ),
    );
  }
}
