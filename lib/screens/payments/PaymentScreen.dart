import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/payments/components/Body.dart';

class TransationData {
  final String label, price, type;

  TransationData(this.label, this.price, this.type);
}

class PaymentScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Text(
              "Pembayaran",
              style: TextStyle(fontFamily: "MetroBold"),
              textScaleFactor: 1.0,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Head(),
            Body(),
          ],
        ),
      ),
    );
  }
}
