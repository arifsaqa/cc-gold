import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:learnUI/controllers/userController.dart';
// import 'package:learnUI/models/recentNumbers.dart';
import 'package:learnUI/screens/transferGold/NominalScreen.dart';

class Body extends StatefulWidget {
  _StateBody createState() => _StateBody();
}

class _StateBody extends State<Body> {
  final transactionController = Get.find<TransactionController>();
  final dataTreeController = Get.put(DataTreeController());
  final userController = Get.find<UserController>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _getNumbers();
    });
  }

  void _getNumbers() async {
    await dataTreeController.getUserNumbers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void confirmDestinationNumber(String destinationNumber) {
    Get.defaultDialog(
      title: "Gunakan promo?",
      titlePadding: EdgeInsets.only(top: 20),
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      middleText:
          "Anda akan menggunakan $destinationNumber sebagai nomor tujuan transfer?",
      backgroundColor: Color(background),
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white, height: 1.3),
      confirm: TextButton(
          onPressed: () async {
            if (dataTreeController.phoneNumbers.contains(destinationNumber) &&
                userController.user.value.phone != destinationNumber) {
              transactionController.destinationNumber.value = destinationNumber;
              Get.to<void>(NominalScreen());
              // execute(res, discount);
            } else if (userController.user.value.phone == destinationNumber) {
              Get.snackbar("Terjadi Kesalahan",
                  "Anda tidak bisa mentransfer ke diri anda sendiri",
                  colorText: Colors.red[400]);
            } else {
              Get.snackbar("Terjadi Kesalahan",
                  "Nomor yg anda tuju tidak terdaftar sebagai user CC Gold",
                  colorText: Colors.red[400]);
            }
          },
          child: Text(
            "Ya",
            style: TextStyle(color: Colors.white),
          )),
      cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Tidak",
            style: TextStyle(color: Color(upperGradient)),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 90),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Transaksi Terakhir",
              textScaleFactor: 1.0,
              style: TextStyle(
                  color: Color.fromRGBO(32, 45, 62, 0.5),
                  fontSize: sm,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Obx(() => (SizedBox(
              height: 300,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount:
                    transactionController.transactionsTF.value.data.length,
                itemBuilder: (context, index) {
                  return transactionController.transactionsTF.value.data[index]
                              .destinationNumber !=
                          null
                      ? InkWell(
                          onTap: () {
                            confirmDestinationNumber(transactionController
                                .transactionsTF
                                .value
                                .data[index]
                                .destinationNumber
                                .toString());
                          },
                          child: Container(
                            height: 60,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                width: 1.0,
                                color: Colors.grey.withOpacity(.08),
                              ))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Container(
                                      width: size.width * .6,
                                      child: Text(
                                        transactionController.transactionsTF
                                            .value.data[index].destinationNumber
                                            .toString(),
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: sm),
                                      ),
                                    )
                                  ]),
                                  Icon(
                                    Icons.chevron_right,
                                    size: 30,
                                    color: Color(light),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container();
                },
              ))))
        ],
      ),
    );
  }
}
