import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/main.dart';
import 'package:learnUI/screens/welcome/password.dart';
import 'package:learnUI/screens/welcome/textField.dart';

class HandlingField extends StatefulWidget {
  final String onClick;

  const HandlingField({Key? key, required this.onClick}) : super(key: key);
  @override
  _StateHandlingField createState() => _StateHandlingField();
}

class _StateHandlingField extends State<HandlingField> {
  String _currentInput = "";

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
    return (Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.only(right: 20),
            child: MyCustomForm1(
              onChange: (context) => setState(() {
                _currentInput = context;
                print(context);
              }),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                print(_currentInput);
                if (widget.onClick == 'login') {
                  Navigator.pushNamed(context, "/verifikasi");
                } else {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Password(
                              redirecto: LoggedIn(), isLoggingin: true)));
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
        )
      ],
    )));
  }
}

class Auth extends StatelessWidget {
  final String title, description, onClick;
  Auth({required this.title, required this.description, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Color(background),
      padding: const EdgeInsets.all(24),
      child: Column(
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
                      title,
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
                      description,
                      textScaleFactor: 1.0,
                      style: TextStyle(fontSize: sm, height: 1.5),
                    ),
                  )
                ],
              ),
            ]),
          ),
          HandlingField(
            onClick: onClick,
          ),
        ],
      ),
    )));
  }
}
