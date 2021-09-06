import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/deviceDataController.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/main.dart';
import 'package:learnUI/screens/sharedComponents/MyGradient.dart';
import 'package:learnUI/screens/welcome/password.dart';
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
  bool _loadingHere = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      int? cok = await cek.getUserId();
      redirect(cok);
    });
  }

  void redirect(int? isSignin) async {
    setState(() {
      _loadingHere = true;
    });
    if (isSignin == 0 || isSignin == null) {
      print("go to login screen  " + isSignin.toString());
      Timer(Duration(seconds: 3), () {
        Get.offAll(Welcome());
        setState(() {
          _loadingHere = false;
        });
      });
      return;
    }
    int i = await controller.getUserById(isSignin);
    if (i != 0) {
      print(isSignin);
      var token = await cek.getToken();
      var istokenValid = await controller.istokenValid(token!);
      if (istokenValid != 0) {
        await controller.getUserSaldo();
        Timer(Duration(milliseconds: 90), () {
          Get.offAllNamed('/logged');
          setState(() {
            _loadingHere = false;
          });
        });
      } else {
        Timer(Duration(milliseconds: 90), () {
          Get.off(Password(redirecto: LoggedIn(), isLoggingin: true));
          setState(() {
            _loadingHere = false;
          });
        });
      }
    } else {
      print("go to login screen  " + isSignin.toString());
      Timer(Duration(seconds: 3), () {
        Get.offNamed("/login");
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
