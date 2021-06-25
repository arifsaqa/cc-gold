import 'package:flutter/material.dart';
import 'package:learnUI/screens/successPayment/components/Head.dart';
import 'package:learnUI/screens/successPayment/components/Body.dart';

class SuccessPaymentScreen extends StatelessWidget {
  final String label, price;
  final int typeId;

  String from, message;

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Head(),
            Body(label: label, price: price, typeId: typeId),
          ],
        ),
      ),
    );
  }
}
