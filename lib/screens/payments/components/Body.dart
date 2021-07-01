import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/paymentMethods.dart';
import 'package:learnUI/screens/chooseBank/chooseBankScreen.dart';
import 'package:learnUI/screens/successPayment/successPaymentScreen.dart';
import 'package:learnUI/screens/welcome/password.dart';

class Body extends StatefulWidget {
  final String label, price;
  final int typeId;

  const Body(
      {Key? key,
      required this.label,
      required this.price,
      required this.typeId})
      : super(key: key);
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          text: widget.typeId == 0 ? 'Beli' : 'Jual',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(priceLabel),
                              fontSize: normal),
                          children: [
                            TextSpan(
                              text: ' Emas ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(priceLabel),
                                  fontSize: normal),
                            ),
                            TextSpan(
                              text: widget.label,
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
                          style:
                              TextStyle(color: Color(priceLabel), fontSize: sm),
                          children: [
                            TextSpan(
                              text: widget.price,
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
                padding:
                    EdgeInsets.only(left: 14, right: 14, bottom: 22, top: 22),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nominal",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        ),
                        Text(
                          widget.price,
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Biaya Admin",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        ),
                        Text(
                          "Rp 0",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        ),
                        Text(
                          widget.price,
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _awaitBankChoice(context);
                },
                child: Container(
                    height: 100,
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
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Metode Pembayaran",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontSize: normal, color: Colors.black)),
                              Row(children: [
                                Container(
                                    width: 33,
                                    height: 10,
                                    child: Image.asset(
                                        paymentMethods[bankIndex].image)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  paymentMethods[bankIndex].label,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(color: Colors.black),
                                )
                              ]),
                            ],
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    )),
              )
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
                      widget.price,
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
                            builder: (context) => widget.typeId != 0
                                ? Password(
                                    redirecto: SuccessPaymentScreen(
                                        label: widget.label,
                                        price: widget.price,
                                        typeId: widget.typeId))
                                : SuccessPaymentScreen(
                                    label: widget.label,
                                    price: widget.price,
                                    typeId: widget.typeId,
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

  void _awaitBankChoice(BuildContext context) async {
    final result = await Navigator.push<int>(
        context,
        MaterialPageRoute<int>(
          builder: (context) => ChooseBankScreen(),
        ));

    setState(() {
      bankIndex = result!;
    });
  }
}
