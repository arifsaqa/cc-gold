import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/payments/components/Head.dart';
import 'package:learnUI/screens/payments/components/Body.dart';

class TransationData {
  final String label, price, type;

  TransationData(this.label, this.price, this.type);
}

class PaymentScreen extends StatelessWidget {
  final String label, price;
  final int typeId;

  const PaymentScreen(
      {Key? key,
      required this.label,
      required this.price,
      required this.typeId})
      : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Text(
              "Pembayaran",
              textScaleFactor: 1.0,
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
