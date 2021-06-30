import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/promos.dart';

class PromosBuild extends StatefulWidget {
  @override
  _PromoBuildState createState() => _PromoBuildState();
}

class _PromoBuildState extends State<PromosBuild> {
  int selectedId = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 0),
              child: Text(
                "Promo Hari Ini",
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Color.fromRGBO(32, 45, 62, 0.5),
                    fontSize: sm,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Container(
                  height: size.height / 3.1,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: promos.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 24),
                            width: 327,
                            decoration: BoxDecoration(
                                color: Color(background),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(22.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      promos[index].description == null
                                          ? Center(
                                              heightFactor: 1.5,
                                              child: Text(
                                                promos[index].title,
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                    color: Color(upperGradient),
                                                    fontSize: normal),
                                              ),
                                            )
                                          : Text(
                                              promos[index].title,
                                              textScaleFactor: 1.0,
                                              style: TextStyle(
                                                  color: Color(upperGradient),
                                                  fontSize: normal),
                                            ),
                                      if (promos[index].description != null)
                                        SizedBox(height: 4),
                                      promos[index].description != null
                                          ? Text(
                                              promos[index].description ?? "",
                                              textScaleFactor: 1.0,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: xm))
                                          : Text(
                                              "",
                                              textScaleFactor: 1.0,
                                              style: TextStyle(fontSize: 0),
                                            )
                                    ],
                                  ),
                                )),
                                Image.asset(promos[index].image)
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
