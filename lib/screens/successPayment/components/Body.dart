import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/transactionType.dart';
import 'package:learnUI/screens/successPayment/components/Separator.dart';

class Body extends StatelessWidget {
  final String label, price;
  final int typeId;

  const Body(
      {Key? key,
      required this.label,
      required this.price,
      required this.typeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 40),
      padding: EdgeInsets.symmetric(horizontal: 24),
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
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 58,
                  width: 58,
                  child: Image.asset("images/success.png")),
              SizedBox(
                height: 10,
              ),
              checkType(typeId),
              SizedBox(
                height: 18,
              ),
              const MySeparator(
                color: Color.fromRGBO(151, 151, 151, 1),
                height: 1,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
          Row(children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: typeId == 0 ? 'Beli' : 'Jual',
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
                            text: label,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(priceLabel),
                                fontSize: normal),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Harga Emas : ",
                        style:
                            TextStyle(color: Color(priceLabel), fontSize: sm),
                        children: [
                          TextSpan(
                            text: price,
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
          ]),
          Container(
            margin: EdgeInsets.only(top: 26),
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nominal",
                      style: TextStyle(color: Colors.black, fontSize: sm),
                    ),
                    Text(
                      price,
                      style: TextStyle(color: Colors.black, fontSize: sm),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Biaya Admin",
                      style: TextStyle(color: Colors.black, fontSize: sm),
                    ),
                    Text(
                      "Rp 0",
                      style: TextStyle(color: Colors.black, fontSize: sm),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(color: Colors.black, fontSize: sm),
                    ),
                    Text(
                      price,
                      style: TextStyle(color: Colors.black, fontSize: sm),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          const MySeparator(
            color: Color.fromRGBO(151, 151, 151, 1),
            height: 1,
          ),
          SizedBox(
            height: 22,
          ),
          SizedBox(
              height: 67, width: 149, child: Image.asset("images/barcode.png"))
        ],
      ),
    );
  }

  Widget checkType(int id) {
    return Text(
      transactionTypes[id].title + " Sukses",
      style: TextStyle(
          fontSize: header, fontWeight: FontWeight.w600, color: Colors.black),
    );
  }
}
