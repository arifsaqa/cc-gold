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
import 'package:learnUI/screens/welcome/password.dart';
import 'package:learnUI/sharedPreferrences/userLocal.dart';

class Welcome extends StatefulWidget {
  @override
  _StateWelcome createState() => _StateWelcome();
}

class _StateWelcome extends State<Welcome> {
  LocalUser cek = LocalUser();
  UserController controller = Get.find<UserController>();
  DeviceDataController deviceController = Get.put(DeviceDataController());
  bool _loadingHere = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      int cok = await cek.getUserId();
      redirect(cok);
    });
  }

  void redirect(int isSignin) async {
    setState(() {
      _loadingHere = true;
    });
    if (isSignin != 0) {
      print(isSignin);
      var token = await cek.getToken();
      var istokenValid = await controller.istokenValid(token!);
      if (istokenValid != 0) {
        await controller.getUserSaldo();
        await controller.getUserById(isSignin);
        Timer(Duration(milliseconds: 90), () {
          Get.offNamed<void>('/logged');
          setState(() {
            _loadingHere = false;
          });
        });
      } else {
        Timer(Duration(milliseconds: 90), () {
          Get.off<void>(Password(redirecto: LoggedIn(), isLoggingin: true));
          setState(() {
            _loadingHere = false;
          });
        });
      }
    } else {
      print("go to login screen  " + isSignin.toString());
      Timer(Duration(seconds: 3), () {
        Get.offAndToNamed<void>("/login");
        setState(() {
          _loadingHere = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(background),
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 10, left: 0, right: 0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      child: Text(
                        "Selamat",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontFamily: "MetroBold",
                          fontSize: xl,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    GradientText(
                      child: Text(
                        "Datang",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontFamily: "MetroBold",
                          fontSize: xl,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "CC Gold hadir dalam platform digital untuk jual beli emas dengan aman. Anda dapat membeli emas kapan saja dan di mana saja",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: sm, letterSpacing: 1, height: 1.5),
                    ),
                  ],
                ),
              )),
          Container(
              height: 8,
              margin: EdgeInsets.only(top: 20),
              child: Image.asset("images/carousel.png"))
        ],
      ),
    ));
  }
}
