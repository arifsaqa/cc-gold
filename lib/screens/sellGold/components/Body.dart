import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/prices.dart';
import 'package:learnUI/models/transactions.dart';

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
            "Pilih Emas",
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
              height: 370,
              width: size.width,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: (150 / 73),
                  ),
                  itemCount: prices.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedId = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment(0, -1),
                                  end: Alignment(0, 0),
                                  colors: [
                                    Color(selectedId == index
                                        ? upperGradient
                                        : 0XFFFFF),
                                    Color(selectedId == index
                                        ? lowerGradient
                                        : 0XFFFFF)
                                  ]),
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      prices[index].label,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(priceLabel),
                                          fontSize: normal),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      prices[index].price,
                                      style: TextStyle(
                                          color: Color(price), fontSize: xm),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))),
        )
      ],
    ));
  }
}
