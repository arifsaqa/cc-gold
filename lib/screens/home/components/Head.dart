import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';

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
        height: size.height * .35,
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Pagi,",
                          style: TextStyle(
                              color: Color(lowerGradient), fontSize: sm),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Mr. Subaidi",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: normal,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Kamis",
                          style: TextStyle(
                              color: Color(lowerGradient), fontSize: sm),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "10 Juni 2021",
                            style: TextStyle(
                                color: Color(lowerGradient), fontSize: sm),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -40,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        color: Color(lowerGradient)),
                    child: Container(
                      padding: EdgeInsets.only(left: 24, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Icon(
                              Icons.trending_up,
                              size: 20,
                              color: Colors.black38,
                            ),
                            Text("0,74%",
                                style: TextStyle(
                                    fontSize: xm, color: Colors.black38))
                          ]),
                          Text(
                            "Harga Jual :",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rp.891.452/gr",
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
                    height: 100,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        color: Color(upperGradient)),
                    child: Container(
                      padding: EdgeInsets.only(left: 24, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Icon(
                              Icons.trending_up,
                              size: 20,
                              color: Colors.black38,
                            ),
                            Text("0,74%",
                                style: TextStyle(
                                    fontSize: xm, color: Colors.black38))
                          ]),
                          Text(
                            "Harga Jual :",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rp.891.452/gr",
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
            Positioned(
              top: size.height * .07,
              right: size.width * .1,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ));
  }
}
