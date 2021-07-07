import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/firebaseFunctions/auth.dart';
import 'package:learnUI/screens/welcome/auth.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  GlobalKey<FormState> _key = new GlobalKey();
  Map<String, String> a = {
    'name': '',
    'email': '',
    'phoneNumber': '',
    'password': '',
    'bank': '',
    'verificationId': '',
  };

  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  String _password = '';
  String _bank = '';
  String verificationId = '';
  bool _showHide = true;
  bool _showLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final node = FocusScope.of(context);

    getOtpFormWidget(BuildContext context) {
      return Column(
        children: [
          Spacer(),
          TextField(
            // controller: otpController,
            decoration: InputDecoration(
              hintText: "Enter OTP",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          FlatButton(
            onPressed: () async {
              // PhoneAuthCredential phoneAuthCredential =
              //     PhoneAuthProvider.credential(
              //         verificationId: verificationId, smsCode: otpController.text);

              // signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text("VERIFY"),
            color: Colors.blue,
            textColor: Colors.white,
          ),
          Spacer(),
        ],
      );
    }

    Column asu = Column(children: [
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
                  'name',
                  false,
                  false,
                  _validateName,
                  node: node),
              SizedBox(
                height: 10,
              ),
              _builFieldFormField(
                  "Email", "", 'email', false, false, _validateBio,
                  node: node),
              SizedBox(
                height: 10,
              ),
              _builFieldFormField("Nomor HP", "Masukkan nomor hp yang aktif",
                  'phoneNumber', false, false, _validateName,
                  node: node),
              SizedBox(
                height: 10,
              ),
              _builFieldFormField(
                  "No Rekening", "", 'bank', false, false, _validateName,
                  node: node),
              SizedBox(
                height: 10,
              ),
              _builFieldFormField(
                  "Password", "", 'password', true, true, _validateName,
                  size: size, node: node),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
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
                          onTap: () async {
                            print(a['phoneNumber']! +
                                'ancoooooooooooooooooooook');
                            setState(() {
                              _showLoading = true;
                            });

                            await Auth1.getAuthInstance.verifyPhoneNumber(
                              phoneNumber: '+62 895352530708',
                              verificationCompleted:
                                  (phoneAuthCredential) async {
                                setState(() {
                                  _showLoading = false;
                                });
                                //signInWithPhoneAuthCredential(phoneAuthCredential);
                              },
                              verificationFailed: (verificationFailed) async {
                                setState(() {
                                  _showLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text(verificationFailed.message!)));
                              },
                              codeSent: (verificationId, resendingToken) async {
                                setState(() {
                                  _showLoading = false;
                                  currentState = MobileVerificationState
                                      .SHOW_OTP_FORM_STATE;
                                  this.verificationId = verificationId;
                                });
                              },
                              codeAutoRetrievalTimeout:
                                  (verificationId) async {},
                            );
                          },
                          child: Center(
                            child: Text(
                              "Daftar",
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
    ]);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(background),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: SingleChildScrollView(
              child:
                  currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                      ? asu
                      : Center(
                          child: Text(
                            "Cek Your Shit",
                            style: TextStyle(color: Colors.white, fontSize: md),
                          ),
                        )),
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
                    setState(() {
                      a[belongsTo] = value;
                    });
                    print(a[belongsTo]);
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
                setState(() {
                  a[belongsTo] = value;
                });
                print(a[belongsTo]);
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
