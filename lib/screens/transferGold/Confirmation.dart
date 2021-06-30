import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/screens/transferGold/components/MyBackButton.dart';
import 'package:learnUI/screens/successPayment/successPaymentScreen.dart';

class Confirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Text(
              "Detail Transfer",
              textScaleFactor: 1.0,
              style: TextStyle(fontFamily: "MetroBold"),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Container(child: Body())],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  // final String label, price;
  // final int typeId;

  // const Body(
  //     {Key? key,
  //     required this.label,
  //     required this.price,
  //     required this.typeId})
  //     : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int bankIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height - 80,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 90,
                    width: 327,
                    padding: EdgeInsets.only(left: 14, bottom: 22, top: 22),
                    margin: EdgeInsets.only(left: 24, right: 24, top: 50),
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          textScaleFactor: 1.0,
                          text: TextSpan(
                              text: 'Transfer ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(priceLabel),
                                  fontSize: normal),
                              children: [
                                TextSpan(
                                  text: 'Emas',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(priceLabel),
                                      fontSize: normal),
                                ),
                                TextSpan(
                                  text: '1 gram',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(priceLabel),
                                      fontSize: normal),
                                ),
                              ]),
                        ),
                        RichText(
                          textScaleFactor: 1.0,
                          text: TextSpan(
                              text: "Harga Emas : ",
                              style: TextStyle(
                                  color: Color(priceLabel), fontSize: sm),
                              children: [
                                TextSpan(
                                  text: "Rp. 893.252",
                                  style: TextStyle(
                                      color: Color(priceLabel), fontSize: sm),
                                ),
                                TextSpan(
                                  text: "/gram",
                                  style: TextStyle(
                                      color: Color(priceLabel), fontSize: sm),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 327,
                    padding: EdgeInsets.only(left: 14, bottom: 22, top: 22),
                    margin: EdgeInsets.only(left: 24, right: 24, top: 50),
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "No Tujuan",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(priceLabel),
                              fontSize: normal),
                        ),
                        Text(
                          "0812 3456 7890",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(priceLabel),
                              fontSize: normal),
                        ),
                        Text("a/n Albert Einstein",
                            textScaleFactor: 1.0,
                            style: TextStyle(color: Color(priceLabel))),
                        Text("Pesan : Selamat Menempuh Hidup Baru",
                            textScaleFactor: 1.0,
                            style: TextStyle(color: Color(priceLabel))),
                      ],
                    ),
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
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Rp. 893.252",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => SuccessPaymentScreen(
                                      label: "1 gram",
                                      price: "Rp. 893.252",
                                      typeId: 2,
                                    )));
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
            ]));
  }
}
