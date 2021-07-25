import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/screens/sharedComponents/MyGradient.dart';

class Head extends StatefulWidget {
  @override
  _HeadState createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(bottom: 60),
        height: 170,
        decoration: BoxDecoration(
          color: Color(background),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                            child: Text(
                          "Selamat Pagi,",
                          textScaleFactor: 1.0,
                          style: TextStyle(fontSize: sm),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GetX<UserController>(
                              init: UserController(),
                              builder: (_) => Text(
                                    _.user.value.user!.name.toString(),
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: normal,
                                        fontWeight: FontWeight.w600),
                                  )),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GradientText(
                            child: Text(
                          "Kamis",
                          textScaleFactor: 1.0,
                          style: TextStyle(fontSize: sm),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GradientText(
                              child: Text(
                            "10 Juni 2021",
                            textScaleFactor: 1.0,
                            style: TextStyle(fontSize: sm),
                          )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: size.width / 2 - 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(upperGradient1),
                            Color(middleGradient1),
                            Color(lowerGragdient1),
                          ]),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 24, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(children: [
                            Icon(
                              Icons.trending_up,
                              size: 20,
                              color: Colors.black38,
                            ),
                            Text("0,74%",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: xm, color: Colors.black38))
                          ]),
                          Text(
                            "Harga Jual :",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rp.891.452/gr",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                fontSize: sm,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: size.width / 2 - 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(upperGradient),
                            Color(middleGradient),
                            Color(lowerGradient),
                          ]),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 24, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(children: [
                            Icon(
                              Icons.trending_down,
                              size: 20,
                              color: Colors.black38,
                            ),
                            Text("0,74%",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: xm, color: Colors.black38))
                          ]),
                          Text(
                            "Harga Beli :",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rp.891.452/gr",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                fontSize: sm,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
