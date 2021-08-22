import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/controllers/verify.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

enum StatusPage { SEND_NUMBER, WAIT_OTP }

class GetOTPYO extends StatefulWidget {
  final String title, description;
  final bool isResetPassword;
  GetOTPYO({
    required this.title,
    required this.description,
    required this.isResetPassword,
  });

  @override
  _StateAuth createState() => _StateAuth();
}

class _StateAuth extends State<GetOTPYO> with CodeAutoFill {
  String _code = "";
  String signature = "{{ app signature }}";
  int _count = 0;
  // late Timer  _timer;
  // var condition = StatusPage.SEND_NUMBER;
  final controller = Get.put(Verify());
  final userController = Get.find<UserController>();
  @override
  void initState() {
    super.initState();
    listenForCode();
    smsAutoFill();
    _count = controller.timeOut.value * controller.rensendIncrement.value;
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      decrementTimeOut();
      if (_count == 0) {
        setState(() {
          t.cancel();
        });
      }
    });
  }

  @override
  void codeUpdated() {
    setState(() {
      _code = code!;
    });
  }

  void decrementTimeOut() {
    if (mounted) {
      setState(() {
        _count -= 1;
      });
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
              SizedBox(
                height: 20,
              ),
              PinFieldAutoFill(
                decoration: UnderlineDecoration(
                  textStyle: TextStyle(fontSize: 20, color: Colors.white),
                  colorBuilder: FixedColorBuilder(Colors.white),
                ),
                currentCode: _code,
                onCodeSubmitted: (code) {},
                onCodeChanged: (code) {
                  if (code!.length == 6) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              controller.loading.value
                  ? SpinKitCircle(
                      color: Colors.white,
                      size: 50.0,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Color(_count == 0
                                            ? upperGradient
                                            : lowerGradient))),
                            onPressed: _count == 0
                                ? () async {
                                    SharedPreferences phone =
                                        await SharedPreferences.getInstance();
                                    int i = await controller.verify(
                                        widget.isResetPassword,
                                        phone
                                            .getString('phone')!
                                            .replaceFirst('0', '+62')
                                            .trim(),
                                        resend: controller.resendToken.value);
                                    if (i == 1) {
                                      await controller.verifiedByOTP();
                                    }
                                  }
                                : null,
                            child: Text(
                              "Kirim ulang kode",
                              textScaleFactor: 1,
                              style: TextStyle(color: Color(background)),
                            )),
                        Text(
                          _count.toString(),
                          textScaleFactor: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Color(_count == 0
                                            ? upperGradient
                                            : lowerGradient))),
                            onPressed: _count == 0
                                ? () {
                                    Get.back();
                                  }
                                : null,
                            child: Text(
                              "Ganti Nomor",
                              textScaleFactor: 1,
                              style: TextStyle(color: Color(background)),
                            ))
                      ],
                    )
            ]),
          ),
        ],
      ),
    )));
  }
}
