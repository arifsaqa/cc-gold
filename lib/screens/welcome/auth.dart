import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/main.dart';
import 'package:learnUI/screens/welcome/password.dart';
import 'package:learnUI/screens/welcome/registerScreen.dart';
import 'package:learnUI/screens/welcome/textField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HandlingField extends StatefulWidget {
  final String onClick, currentInput;

  const HandlingField(
      {Key? key, required this.onClick, required this.currentInput})
      : super(key: key);
  @override
  _StateHandlingField createState() => _StateHandlingField();
}

class _StateHandlingField extends State<HandlingField> {
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

  Future<void> saveInput(String phone) async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setString("phone", phone);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  print(widget.currentInput);
                  if (widget.onClick == 'login') {
                    await saveInput(widget.currentInput);
                    Get.to<void>(
                        Password(redirecto: LoggedIn(), isLoggingin: true));
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
    );
  }
}

class Auth extends StatefulWidget {
  String title, description, onClick;

  Auth({required this.title, required this.description, required this.onClick});

  @override
  _StateAuth createState() => _StateAuth();
}

class _StateAuth extends State<Auth> {
  String _currentInput = "";
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
              Container(
                  padding: EdgeInsets.only(top: 20),
                  margin: EdgeInsets.only(right: 20),
                  child: MyCustomForm1(
                    onChange: (context) => setState(() {
                      _currentInput = context;
                      print(context);
                    }),
                  )),
            ]),
          ),
          HandlingField(
            onClick: widget.onClick,
            currentInput: _currentInput,
          ),
        ],
      ),
    )));
  }
}
