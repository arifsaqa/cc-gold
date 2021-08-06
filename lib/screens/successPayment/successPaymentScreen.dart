import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/successPayment/components/Head.dart';
import 'package:learnUI/screens/successPayment/components/Body.dart';

class SuccessPaymentScreen extends StatefulWidget {
  @override
  _SuccessPaymentScreenState createState() => _SuccessPaymentScreenState();
}

class _SuccessPaymentScreenState extends State<SuccessPaymentScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => {
          Get.snackbar("Transaksi diterima!",
              "Notifikasi akan dikirim setelah kami memvalidasi transaksi anda",
              colorText: Colors.greenAccent,
              backgroundColor: Color(background),
              duration: Duration(seconds: 3))
        });
  }

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
            Body(),
          ],
        ),
      ),
    );
  }
}
