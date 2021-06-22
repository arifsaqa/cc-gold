import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/news.dart';

class Body extends StatefulWidget {
  @override
  _PromoBuildState createState() => _PromoBuildState();
}

class _PromoBuildState extends State<Body> {
  int selectedId = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 0),
            child: Text(
              "Promo Hari Ini",
              style: TextStyle(
                  color: Color.fromRGBO(32, 45, 62, 0.5),
                  fontSize: sm,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
                height: 300,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(news[index].image),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6),
                                width: size.width * .6,
                                child: Text(
                                  news[index].title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                width: size.width * .6,
                                child: Text(
                                  news[index].date,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 12),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
