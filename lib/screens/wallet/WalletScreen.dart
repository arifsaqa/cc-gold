import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/screens/wallet/components/Body.dart';
import 'package:learnUI/screens/wallet/components/Head.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Title(
            color: Color(background),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Dompet Emas",
                textScaleFactor: 1.0,
                style: TextStyle(fontFamily: "MetroBold"),
              ),
            )),
      ),
      body: Column(
        children: [Head(), Body()],
      ),
    );
  }
}
