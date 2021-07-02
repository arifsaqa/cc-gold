import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/successPayment/components/Head.dart';
import 'package:learnUI/screens/successPayment/components/Body.dart';

class SuccessPaymentScreen extends StatelessWidget {
  final String label, price;
  final int typeId;

  final String? from, message;

  SuccessPaymentScreen(
      {Key? key,
      required this.label,
      required this.price,
      this.from = "",
      this.message = "",
      required this.typeId})
      : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Text(
              "Laporan Traksaksi",
              textScaleFactor: 1.0,
              style: TextStyle(fontFamily: "MetroBold"),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Head(),
            Body(label: label, price: price, typeId: typeId),
          ],
        ),
      ),
    );
  }
}
