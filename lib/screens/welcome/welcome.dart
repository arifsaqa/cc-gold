import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/deviceDataController.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/main.dart';
import 'package:learnUI/screens/sharedComponents/MyGradient.dart';
import 'package:learnUI/screens/welcome/password.dart';
import 'package:learnUI/sharedPreferrences/userLocal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  @override
  _StateWelcome createState() => _StateWelcome();
}

class _StateWelcome extends State<Welcome> {
  LocalUser cek = LocalUser();
  UserController controller = Get.put(UserController());
  DeviceDataController deviceController = Get.put(DeviceDataController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      // await cek.setLocalUser(false, 0, '');

      print('coooooooook' + deviceController.deviceId.value);
      int cok = await cek.getUserId();
      redirect(cok);
    });
  }

  void redirect(int isSignin) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (isSignin != 0) {
      var token = await pref.getString("token");
      await controller.istokenValid(token!);
      if (controller.tokenStatus.value.status != 0) {
        await controller.getUserById(isSignin);
        Navigator.pushReplacementNamed(context, "/logged");
      } else {
        await controller.getUserById(isSignin);
        Navigator.push<void>(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Password(redirecto: LoggedIn(), isLoggingin: true)));
      }
    } else {
      print("go to login screen  " + isSignin.toString());
      Navigator.pushReplacementNamed(context, "/login");
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
                    GetBuilder<DeviceDataController>(
                      init: deviceController, // INIT IT ONLY THE FIRST TIME
                      builder: (_) => Text(
                        '${_.deviceId}',
                      ),
                    ),
                    Text(
                      "CC Gold hadir dalam platform digital untuk jual beli emas dengan aman. Anda dapat membeli emas kapan saja dan di mana saja",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: sm, letterSpacing: 1, height: 1.5),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
