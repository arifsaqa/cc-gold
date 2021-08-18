import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/screens/otpVerification/Verify.dart';

enum StateStatus { done, not }

class Password extends StatefulWidget {
  final Widget redirecto;
  final bool isLoggingin;

  const Password({Key? key, required this.redirecto, required this.isLoggingin})
      : super(key: key);
  _StatePassword createState() => _StatePassword();
}

class _StatePassword extends State<Password> {
  final UserController controller = Get.put(UserController());
  final key = new GlobalKey<ScaffoldState>();
  String _typedPassword = '';
  // bool isLoading = false;
  void onTap() {
    if (mounted) {
      setState(() {
        if (_typedPassword.length > 0) {
          String finalStr =
              _typedPassword.substring(0, _typedPassword.length - 1) +
                  _typedPassword.substring(_typedPassword.length - 1 + 1);
          _typedPassword = finalStr;
        }
      });
    }
  }

  void onPress() {
    if (mounted) {
      setState(() {
        if (_typedPassword.length > 0) {
          _typedPassword = '';
        }
      });
    }
  }

  void inputController(String input) {
    if (mounted) {
      setState(() {
        if (_typedPassword.length <= 6) {
          _typedPassword += input;
        }
      });
    }
  }

  void cekPassword() async {
    // LocalUser cek = LocalUser();
    var cekLogin = await controller.login(_typedPassword);
    if (cekLogin == "oke") {
      await controller.getUserSaldo();
      // int userId = await cek.getUserId();
      // await controller.getUserById(userId);
      setState(() {
        _typedPassword = '';
      });
      await Get.off<void>(widget.redirecto);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitCircle(
      color: Colors.white,
      size: 50.0,
    );

    Size size = MediaQuery.of(context).size;
    if (mounted) {
      // ignore: unnecessary_statements
      _typedPassword.length == 6
          ? Future.delayed(Duration.zero, () {
              cekPassword();
            })
          : "";
      // _asu == true
      //     ? Get.snackbar<void>('User 123', 'Successfully created',
      //         snackPosition: SnackPosition.BOTTOM)
      //     : "";
    }

    return SafeArea(
      child: Scaffold(
          key: key,
          body: SingleChildScrollView(
              child: Container(
            height: size.height,
            color: Color(background),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Text(
                                "PIN",
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
                                "Masukkan PIN anda",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  fontSize: sm,
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 39),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Circle(
                        isFill: _typedPassword.length >= 1,
                      ),
                      Circle(
                        isFill: _typedPassword.length >= 2,
                      ),
                      Circle(
                        isFill: _typedPassword.length >= 3,
                      ),
                      Circle(
                        isFill: _typedPassword.length >= 4,
                      ),
                      Circle(
                        isFill: _typedPassword.length >= 5,
                      ),
                      Circle(
                        isFill: _typedPassword.length >= 6,
                      )
                    ],
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.symmetric(horizontal: 10)),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (state) => Colors.white10),
                        foregroundColor: MaterialStateProperty.resolveWith(
                            (state) => Colors.white)),
                    onPressed: () {
                      Get.to(VerifyPhone(
                          isResetPassword: true,
                          title: "Verifikasi",
                          description:
                              "Verifikasi nomor hp anda untuk mereset pin",
                          onClick: 'ha'));
                    },
                    child: Text(
                      'Lupa Pin?',
                      style: TextStyle(fontSize: sm),
                      textScaleFactor: 1.0,
                    )),
                // SizedBox(
                //   height: 20,
                // ),
                GetX<UserController>(
                    init: UserController(),
                    builder: (_) => Container(
                          child: _.loading.value
                              ? spinkit
                              : buttons([
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7',
                                  '8',
                                  '9',
                                  '',
                                  '0',
                                  '0'
                                ], context, onTap, onPress, inputController),
                        )),
                SizedBox(height: 20),
                Container(
                  child: widget.isLoggingin
                      ? TextButton(
                          onPressed: () {
                            Get.toNamed('/login');
                            controller.loading.value = false;
                          },
                          child: Text("Ganti Akun Lain",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Colors.white,
                              )))
                      : SizedBox(height: 0),
                ),
                // TextButton(
                //     onPressed: null,
                //     child: Text("Ganti Akun Lain",
                //         textScaleFactor: 1.0,
                //         style: TextStyle(
                //           color: Colors.white,
                //         ))),
                // SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          ))),
    );
  }
}

class Circle extends StatelessWidget {
  final bool isFill;

  const Circle({Key? key, required this.isFill}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      width: 22.0,
      height: 22.0,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isFill
                  ? [
                      Color(upperGradient1),
                      Color(middleGradient1),
                      Color(lowerGragdient1),
                    ]
                  : [
                      Color(background),
                      Color(background),
                      Color(background),
                    ]),
          shape: BoxShape.circle,
          border: isFill
              ? Border.all(color: Color(background))
              : Border.all(color: Colors.white)),
    );
  }
}

SizedBox buttons(List<String> child, BuildContext context, Function onTap,
    Function onPress, Function inputController) {
  return SizedBox(
    height: 220,
    child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: (150 / 73),
        ),
        itemCount: child.length,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
                child: index < child.length - 1
                    ? TextButton(
                        onPressed: () {
                          inputController(child[index]);
                        },
                        child: Text(
                          child[index],
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.white, fontSize: name),
                        ))
                    : GestureDetector(
                        onTap: () {
                          onTap();
                        },
                        onLongPress: () {
                          onPress();
                        },
                        child: Icon(
                          Icons.backspace_outlined,
                          size: name,
                          color: Colors.white,
                        ),
                      )),
          );
        }),
  );
}
