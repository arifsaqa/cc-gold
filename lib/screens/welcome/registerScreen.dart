import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/deviceDataController.dart';
import 'package:learnUI/controllers/userController.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _StateResgisterScreen createState() => _StateResgisterScreen();
}

class _StateResgisterScreen extends State<RegisterScreen> {
  int index = 0;
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  var name = '';
  var email;
  var bankAccount;
  var phone;
  var image;
  var deviceId;
  var password = '';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final deviceController = Get.put(DeviceDataController());

    InputDecoration buildInputDecoration({
      required IconData icons,
      required String hinttext,
      required int myIndex,
      int? counter,
    }) {
      return InputDecoration(
        hintText: hinttext,
        prefixIcon: Icon(
          icons,
          color: index == myIndex ? Colors.white : Color(lowerGradient),
        ),
        counter: SizedBox.shrink(),
        focusedErrorBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.white, width: 1.5),
        ),
        hintStyle:
            TextStyle(color: Color.fromRGBO(255, 255, 255, .5), fontSize: sm),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Color(lowerGradient),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Color(lowerGradient),
            width: 1.5,
          ),
        ),
      );
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            width: size.width,
            color: Color(background),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Daftar",
                      textScaleFactor: 1.0,
                      style:
                          TextStyle(fontSize: md, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Easy gold anywhere, everywhere",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontSize: sm, color: Color(lowerGradient)),
                      ),
                    )
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      TextField(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        autofocus: true,
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                          print(name);
                        },
                        focusNode: _focusNodes[0],
                        decoration: buildInputDecoration(
                          hinttext: "Name",
                          myIndex: 0,
                          icons: Icons.person,
                        ),
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          fontSize: normal,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        focusNode: _focusNodes[1],
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        decoration: buildInputDecoration(
                            myIndex: 1, hinttext: "Email", icons: Icons.email),
                        keyboardType: TextInputType.emailAddress,
                        // onChanged: widget.onChange,
                        style: TextStyle(
                          fontSize: normal,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        focusNode: _focusNodes[2],
                        decoration: buildInputDecoration(
                          icons: Icons.credit_card,
                          hinttext: "No Rekening",
                          myIndex: 2,
                        ),
                        onChanged: (val) {
                          setState(() {
                            bankAccount = val;
                          });
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: normal,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        onTap: () {
                          setState(() {
                            index = 3;
                          });
                        },
                        focusNode: _focusNodes[3],
                        decoration: buildInputDecoration(
                            icons: Icons.lock, hinttext: "PIN", myIndex: 3),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        maxLength: 6,
                        onChanged: (val) {
                          print(val.length);
                          if (val.length <= 6) {
                            setState(() {
                              password = val;
                            });
                          }
                        },
                        style: TextStyle(
                          fontSize: normal,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        onTap: () {
                          setState(() {
                            index = 4;
                          });
                        },
                        focusNode: _focusNodes[4],
                        decoration: buildInputDecoration(
                            hinttext: "No Hp", icons: Icons.phone, myIndex: 4),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() {
                            phone = val;
                          });
                        },
                        style: TextStyle(
                          fontSize: normal,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 40),
                      Obx(() => controller.loading.value
                          ? SpinKitCircle(
                              color: Colors.white,
                              size: 50.0,
                            )
                          : FloatingActionButton(
                              onPressed: () async {
                                var oke = await controller.register(
                                    name,
                                    email,
                                    bankAccount,
                                    phone,
                                    image,
                                    deviceController.deviceId.value,
                                    password);
                                if (oke == 'oke') {
                                  Get.offNamed('/logged');
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
                            ))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
