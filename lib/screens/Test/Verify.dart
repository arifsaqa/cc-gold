import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/verify.dart';
import 'package:learnUI/main.dart';
import 'package:learnUI/screens/Test/otpCode.Screen.dart';
import 'package:learnUI/screens/welcome/password.dart';
import 'package:learnUI/screens/welcome/registerScreen.dart';
import 'package:learnUI/screens/welcome/textField.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

enum StatusPage { SEND_NUMBER, WAIT_OTP }

// class HandlingField extends StatefulWidget {
//   final String onClick = 'ha', currentInput;

//   const HandlingField({Key? key, required this.currentInput}) : super(key: key);
//   @override
//   _StateHandlingField createState() => _StateHandlingField();
// }

// class _StateHandlingField extends State<HandlingField> {
//   var condition = StatusPage.SEND_NUMBER;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     SmsAutoFill().unregisterListener();
//     super.dispose();
//   }

//   Text titleAlert(String cek) {
//     if (cek == "verif") {
//       return Text(
//         "Verifikasi",
//         textScaleFactor: 1.0,
//         style: TextStyle(color: Colors.black),
//       );
//     } else {
//       return Text(
//         "Login",
//         textScaleFactor: 1.0,
//         style: TextStyle(color: Colors.black),
//       );
//     }
//   }

//   Future<void> saveInput(String phone) async {
//     SharedPreferences ref = await SharedPreferences.getInstance();
//     ref.setString("phone", phone);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(Verify());
//     return
//   }
// }

class VerifyPhone extends StatefulWidget {
  final String title, description, onClick;
  VerifyPhone(
      {required this.title, required this.description, required this.onClick});

  @override
  _StateAuth createState() => _StateAuth();
}

class _StateAuth extends State<VerifyPhone> {
  String _currentInput = "";
  String _code = "";
  String signature = "{{ app signature }}";
  var condition = StatusPage.SEND_NUMBER;

  @override
  void initState() {
    super.initState();
    if (condition == StatusPage.WAIT_OTP) {
      smsAutoFill();
    }
  }

  void smsAutoFill() async {
    await SmsAutoFill().listenForCode;
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
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
                  child: condition == StatusPage.SEND_NUMBER
                      ? MyCustomForm1(
                          onChange: (context) => setState(() {
                            _currentInput = context;
                          }),
                        )
                      : PinFieldAutoFill(
                          decoration: UnderlineDecoration(
                            textStyle:
                                TextStyle(fontSize: 20, color: Colors.black),
                            colorBuilder: FixedColorBuilder(Colors.white),
                          ),
                          currentCode: _code,
                          onCodeSubmitted: (code) {},
                          onCodeChanged: (code) {
                            if (code!.length == 6) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            }
                          },
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
                        print(_currentInput);
                        if (widget.onClick != 'login') {
                          setState(() {
                            condition = StatusPage.WAIT_OTP;
                          });
                          controller.toTrue();
                          await controller
                              .verify(_currentInput.replaceFirst('0', '+62'));
                          Get.to(OTPSreen());
                        }
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
