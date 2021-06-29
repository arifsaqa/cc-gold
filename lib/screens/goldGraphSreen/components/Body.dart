import 'package:flutter/material.dart';
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
            "Berita Terkini",
            textScaleFactor: 1.0,
            style: TextStyle(
                color: Color.fromRGBO(32, 45, 62, 0.5),
                fontSize: sm,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.05),
                    spreadRadius: 10,
                    blurRadius: 2,
                    offset: Offset(2, 10))
              ]),
          padding: EdgeInsets.only(top: 20),
          child: SizedBox(
              height: 270,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: 1.0,
                        color: Colors.grey.withOpacity(.05),
                      ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset(news[index].image),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: size.width * .6,
                                child: Text(
                                  news[index].title,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                width: size.width * .6,
                                child: Text(
                                  news[index].date,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 12),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
        )
      ],
    ));
  }
}
