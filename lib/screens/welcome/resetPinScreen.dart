import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/userController.dart';

enum StateStatus { done, not }

class ResetPinScreen extends StatefulWidget {
  final String redirecto;

  const ResetPinScreen({Key? key, required this.redirecto}) : super(key: key);
  _StatePassword createState() => _StatePassword();
}

class _StatePassword extends State<ResetPinScreen> {
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
    var isResetDone = await controller.resetSandi(_typedPassword);
    if (isResetDone == "oke") {
      setState(() {
        _typedPassword = '';
      });
      Future.delayed(Duration(seconds: 3), () {
        Get.offNamed(widget.redirecto);
      });
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
      _typedPassword.length == 6
          ? Future.delayed(Duration.zero, () {
              cekPassword();
            })
          : "";
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
