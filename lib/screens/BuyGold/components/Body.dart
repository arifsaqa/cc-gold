import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/prices.dart';

class Body extends StatefulWidget {
  @override
  _PromoBuildState createState() => _PromoBuildState();
}

class _PromoBuildState extends State<Body> {
  int selectedId = 0;
  String selectePrice = prices[0].price;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, bottom: 0, top: 24),
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
                ),
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: 370,
                    width: size.width,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (150 / 73),
                        ),
                        itemCount: prices.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedId = index;
                                  selectePrice = prices[index].price;
                                });
                              },
                              child: Container(
                                height: 10,
                                width: 160,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.08),
                                      offset: Offset(
                                        5.0,
                                        5.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ],
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
                                  borderRadius: BorderRadius.circular(8),
                                ),
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
                                                color: Color(price),
                                                fontSize: xm),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))),
              ),
            ],
          ),
          Container(
            height: 96,
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total :",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      selectePrice,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: normal,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                //           ElevatedButton(
                //             onPressed: null,
                //             style: ElevatedButton.styleFrom(
                //                 primary: Colors.redAccent, //background color of button
                // //border width and color
                //                 elevation: 3, //elevation of button
                //                 shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(30)
                //                     //to set border radius to button
                //                     // borderRaius: BorderRadius.circular(30)
                //                     ),
                //                 padding: EdgeInsets.all(20) //content padding inside button
                //                 ),
                //             child: Text(
                //               "Konfirmasi",
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: sm,
                //                   fontWeight: FontWeight.w600),
                //             ),
                //           )
                ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Konfirmasi",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sm,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(Color(background)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
