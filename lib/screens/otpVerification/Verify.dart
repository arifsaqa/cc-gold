import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/verify.dart';
import 'package:learnUI/screens/otpVerification/otpCode.Screen.dart';
import 'package:learnUI/screens/welcome/registerScreen.dart';
import 'package:learnUI/screens/welcome/textField.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StatusPage { SEND_NUMBER, WAIT_OTP }

class VerifyPhone extends StatefulWidget {
  final String title, description, onClick;
  final bool isResetPassword;
  VerifyPhone(
      {required this.title,
      required,
      required this.description,
      required this.onClick,
      required this.isResetPassword});

  @override
  _StateAuth createState() => _StateAuth();
}

class _StateAuth extends State<VerifyPhone> {
  String _currentInput = "";
  var condition = StatusPage.SEND_NUMBER;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      _getPhone();
    });
  }

  void _getPhone() async {
    SharedPreferences a = await SharedPreferences.getInstance();
    String? phone = a.getString('phone');
    setState(() {
      _currentInput = phone != null ? phone : '';
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> saveInput(String phone) async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setString("phone", phone);
  }

  Text titleAlert(String cek) {
    if (cek == "verif") {
      return Text(
        "Verifikasi",
        textScaleFactor: 1.0,
        style: TextStyle(color: Colors.black),
      );
    } else {
      return Text(
        "Login",
        textScaleFactor: 1.0,
        style: TextStyle(color: Colors.black),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Verify());
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: MediaQuery.of(context).size.height,
      color: Color(background),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(bottom: 10, top: 100),
                    child: Text(
                      widget.title,
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontFamily: "MetroBold",
                        fontSize: md,
                      ),
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.description,
                      textScaleFactor: 1.0,
                      style: TextStyle(fontSize: sm, height: 1.5),
                    ),
                  )
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  margin: EdgeInsets.only(right: 20),
                  child: MyCustomForm1(
                    initialValue: _currentInput,
                    onChange: (context) => setState(() {
                      _currentInput = context;
                    }),
                  )),
            ]),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.onClick == 'login'
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () => Get.to<void>(RegisterScreen()),
                                child: Text(
                                  "Belum Punya Akun?",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    fontSize: sm,
                                  ),
                                ),
                              )
                            ],
                          )
                        : Container(),
                    FloatingActionButton(
                      onPressed: () async {
                        await saveInput(_currentInput);
                        await controller.toTrue();
                        await controller.verify(
                          widget.isResetPassword,
                        );
                        controller.toFalse();
                        Get.to(GetOTPYO(
                            isResetPassword: widget.isResetPassword,
                            title: "Kode OTP",
                            description:
                                "Kode Otp akan terisi otomatis jika nomor yang anda verifikasi berada di perangkat ini"));
                        // }
                      },
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(upperGradient1),
                                    Color(middleGradient1),
                                    Color(lowerGragdient1),
                                  ])),
                          child: Icon(Icons.arrow_forward)),
                      foregroundColor: Color(background),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    )));
  }
}
