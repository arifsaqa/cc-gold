import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/screens/goldGraphSreen/components/Chart.dart';

class Head extends StatefulWidget {
  @override
  _StateHead createState() => _StateHead();
}

class _StateHead extends State<Head> {
  bool isSale = true;
  int indexFromParent = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2.5,
      width: size.width,
      decoration: BoxDecoration(
        color: Color(background),
      ),
      child: SafeArea(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSale = true;
                        });
                      },
                      child: Container(
                          width: size.width / 2,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: !isSale ? Colors.black12 : Colors.white10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Harga Jual",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: sm, fontFamily: "MetroMedium"),
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSale = false;
                          indexFromParent = 0;
                        });
                      },
                      child: Container(
                          width: size.width / 2,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: isSale ? Colors.black12 : Colors.white10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Harga Beli",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: sm, fontFamily: "MetroMedium"),
                              )
                            ],
                          )),
                    )
                  ],
                ),
                Chart(
                  isSale: isSale,
                ),
              ]),
        ),
      ),
    );
  }
}
