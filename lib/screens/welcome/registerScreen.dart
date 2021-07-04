import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _key = new GlobalKey();
  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  String _password = '';
  String _bank = '';
  bool _showHide = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
    return Scaffold(
        backgroundColor: Color(background),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(bottom: 10, top: 100),
                    child: Text(
                      "Register",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontFamily: "MetroBold",
                        fontSize: md,
                      ),
                    ),
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Lengkapi data di bawah",
                        textScaleFactor: 1.0,
                        style: TextStyle(fontSize: sm, height: 1.5),
                      ),
                    )
                  ],
                ),
              ),
              Form(
                  key: _key,
                  autovalidateMode: AutovalidateMode.always,
                  // autovalidate: _autoValidate,
                  child: Column(
                    children: [
                      _builFieldFormField(
                          "Nama",
                          "Pastikan nama sesuai dengan akun bank",
                          _name,
                          false,
                          false,
                          _validateName,
                          node: node),
                      SizedBox(
                        height: 10,
                      ),
                      _builFieldFormField(
                          "Email", "", _email, false, false, _validateBio,
                          node: node),
                      SizedBox(
                        height: 10,
                      ),
                      _builFieldFormField(
                          "Nomor HP",
                          "Masukkan nomor hp yang aktif",
                          _phoneNumber,
                          false,
                          false,
                          _validateName,
                          node: node),
                      SizedBox(
                        height: 10,
                      ),
                      _builFieldFormField(
                          "No Rekening", "", _bank, false, false, _validateName,
                          node: node),
                      SizedBox(
                        height: 10,
                      ),
                      _builFieldFormField(
                          "Password", "", _password, true, true, _validateName,
                          size: size, node: node),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(upperGradient1),
                                      Color(middleGradient1),
                                      Color(lowerGragdient1),
                                    ])),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  onTap: null,
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Color(background),
                                          fontSize: normal,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            ),
                          ))
                    ],
                  )),
            ]),
          ),
        ));
  }

  String _validateName(String value) {
    if (value.length == 0) {
      return '*Required Field';
    } else if (value.length < 3) {
      return 'Name is too short';
    } else {
      return '';
    }
  }

  String _validateUserName(String value) {
    if (value.length == 0) {
      return '*Required Field';
    } else if (value.length < 3) {
      return 'UserName is too short';
    } else {
      return '';
    }
  }

  String _validateAge(String value) {
    String pattern = r'(^[1-9 ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return '*Required Field';
    } else if (!regExp.hasMatch(value)) {
      return 'Age should be numeric';
    } else {
      return '';
    }
  }

  String _validateBio(String value) {
    if (value.length == 0) {
      return '*Required Field';
    } else if (value.length < 20) {
      return 'Bio should be more than 20 charectors';
    } else {
      return '';
    }
  }

  Widget _builFieldFormField(String label, String hint, String belongsTo,
      bool isPassword, bool? showHidePass, Function validator,
      {Size? size, FocusNode? node}) {
    return isPassword
        ? Container(
            width: size!.width,
            padding: EdgeInsets.only(right: 20),
            child: Stack(
              children: [
                TextFormField(
                  cursorColor: Color(upperGradient),
                  style: TextStyle(color: Color(upperGradient)),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white30),
                      helperStyle: TextStyle(color: Color(upperGradient)),
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: label,
                      hintText: hint),
                  onChanged: (value) {
                    belongsTo = value;
                    print(belongsTo);
                  },
                  validator: (value) {
                    validator(value!);
                  },
                  obscureText: _showHide,
                ),
                Positioned(
                  right: 0,
                  bottom: 15,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showHide = !_showHide;
                        });
                      },
                      child: Icon(
                        _showHide ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.only(right: 20),
            child: TextFormField(
              cursorColor: Color(upperGradient),
              style: TextStyle(color: Color(upperGradient)),
              obscureText: isPassword,
              keyboardType: TextInputType.text,
              onEditingComplete: () => node!.nextFocus(),
              onChanged: (value) {
                belongsTo = value;
                print(belongsTo);
              },
              validator: (value) {
                validator(value!);
              },
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white30),
                  helperStyle: TextStyle(color: Color(upperGradient)),
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: label,
                  hintText: hint),
            ),
          );
  }
}
