import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/profile/components/Body.dart';
import 'package:learnUI/screens/profile/components/Head.dart';

class ProfileScreen extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Profil Saya",
                textScaleFactor: 1.0,
                style: TextStyle(fontFamily: "MetroBold"),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Head(), Body()],
        ),
      ),
    );
  }
}
