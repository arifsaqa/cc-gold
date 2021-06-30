import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/prices.dart';
import 'package:learnUI/screens/sharedComponents/MyGradient.dart';
import 'package:learnUI/screens/transferGold/SetMessageScreen.dart';
import 'package:learnUI/screens/payments/PaymentScreen.dart';

class NominalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Text(
              "Nominal Transfer",
              textScaleFactor: 1.0,
              style: TextStyle(fontFamily: "MetroBold"),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Head(), Body()],
        ),
      ),
    );
  }
}

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width,
      padding: EdgeInsets.only(right: 24, left: 24),
      decoration: BoxDecoration(
        color: Color(background),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Harga jual Emas"),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GradientText(
                            child: Text(
                          "Rp. 893.252",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            fontSize: input,
                            // color: Color(upperGradient),
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                        Text("/gram")
                      ],
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Kamis",
                  textScaleFactor: 1.0,
                  style: TextStyle(color: Colors.white, fontSize: sm),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    "10 Juni 2021",
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.white, fontSize: sm),
                  ),
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}

// class Saldo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Saldo Emas Kamu"),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5.0),
//               child: Text(
//                 "2,000 gram",
//                 textScaleFactor: 1.0,
//                 style: TextStyle(
//                     fontSize: input,
//                     color: Color(upperGradient),
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//             Row(children: [
//               Text(
//                 "Senilai Rp. ",
//                 textScaleFactor: 1.0,
//                 style: TextStyle(fontSize: normal),
//               ),
//               Text(
//                 "1.080.000",
//                 textScaleFactor: 1.0,
//                 style: TextStyle(fontSize: normal),
//               )
//             ])
//           ],
//         ),
//         Icon(
//           Icons.visibility,
//           color: Colors.white,
//         )
//       ],
//     );
//   }
// }

class Body extends StatefulWidget {
  @override
  _PromoBuildState createState() => _PromoBuildState();
}

class _PromoBuildState extends State<Body> {
  int selectedId = 0;
  String selectePrice = prices[0].price;
  String selectedLabel = prices[0].label;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, bottom: 0, top: 24),
                child: Text(
                  "Pilih Emas",
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
                                  selectedLabel = prices[index].label;
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
                                            textScaleFactor: 1.0,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Color(priceLabel),
                                                fontSize: normal),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            prices[index].price,
                                            textScaleFactor: 1.0,
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
            padding: EdgeInsets.symmetric(vertical: 20),
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
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      selectePrice,
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: normal,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push<TransationData>(
                        context,
                        MaterialPageRoute<TransationData>(
                            builder: (context) => SetMessage()));
                  },
                  child: Text(
                    "Konfirmasi",
                    textScaleFactor: 1.0,
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
