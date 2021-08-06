import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/deviceDataController.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/main.dart';
import 'package:learnUI/screens/sharedComponents/MyGradient.dart';
import 'package:learnUI/screens/welcome/welcome.dart';
import 'package:learnUI/sharedPreferrences/userLocal.dart';

class SplashScreen extends StatefulWidget {
  @override
  _StateSplashScreen createState() => _StateSplashScreen();
}

class _StateSplashScreen extends State<SplashScreen> {
  LocalUser cek = LocalUser();
  UserController controller = Get.find<UserController>();
  DeviceDataController deviceController = Get.put(DeviceDataController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Timer(Duration(seconds: 3), () {
        Get.off(Welcome());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color(background),
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 100, child: Image.asset('images/Logo.png')),
                    SizedBox(
                      height: 20,
                    ),
                    GradientText(
                        child: Text("CC GOLD",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              // fontFamily: "MetroBold",
                              fontSize: xl,
                              letterSpacing: 1,
                            )))
                  ]),
            )));
  }
}
