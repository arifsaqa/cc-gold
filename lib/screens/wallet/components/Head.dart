import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:learnUI/bindings/formater.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/screens/sharedComponents/MyGradient.dart';
import 'package:get/get.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width,
      padding: EdgeInsets.only(
          top: size.height * .01, right: 24, left: 24, bottom: 20),
      decoration: BoxDecoration(
        color: Color(background),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Saldo(),
          ],
        ),
      ),
    );
  }
}

class Saldo extends StatefulWidget {
  _SaldoState createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  final textcontroller = TextEditingController();
  bool _loading = false;
  final controller = Get.find<UserController>();
  final dataController = Get.find<DataTreeController>();
  final formatter = Get.find<Formatter>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // if (controller.transactions.value.data.length < 1) {
      _getTransactions();
      // }
    });
  }

  void _getTransactions() {
    controller.getUserSaldo();
  }

  Future<void> execute(String res) async {
    Get.snackbar("Poin", res,
        colorText: res == 'Poin berhasil digunakan, saldo akan diupdate!'
            ? Colors.green[400]
            : Colors.red[400]);

    return;
  }

  void tukarPoint() {
    Get.defaultDialog(
      title: "Tukar Point?",
      titlePadding: EdgeInsets.only(top: 20),
      // contentPadding: EdgeInsets.symmetric(vertical: 20),
      //  /   middleText: "Anda yakin ingin menukar point?",
      backgroundColor: Color(background),
      titleStyle: TextStyle(color: Colors.white),
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: textcontroller,
          decoration: InputDecoration(
            hintText: "Masukkan jumlah point",
            counter: SizedBox.shrink(),
            focusedErrorBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            hintStyle: TextStyle(
                color: Color.fromRGBO(255, 255, 255, .5), fontSize: sm),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Color(lowerGradient),
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Color(lowerGradient),
                width: 1.5,
              ),
            ),
          ),
          onChanged: (val) {
            print(val);
          },
        ),
      ),
      middleTextStyle: TextStyle(color: Colors.white),
      confirm: TextButton(
          // style: ButtonStyle(),
          onPressed: () async {
            Get.back();
            String res =
                await controller.usePoints(int.parse(textcontroller.text));
            execute(res);
          },
          child: Text(
            "Oke",
            style: TextStyle(color: Colors.white),
          )),
      cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: Color(upperGradient)),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saldo Emas Kamu",
                  textScaleFactor: 1.0,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GradientText(
                        child: Obx(
                      () => Text(
                        controller.isSaldoVisible.value
                            ? controller.saldo.value.saldo != null
                                ? controller.saldo.value.saldo.toString() +
                                    " gram"
                                : 0.toString() + " gram"
                            : "**********",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontSize: input, fontFamily: "MetroMedium"),
                      ),
                    ))),
                Row(children: [
                  Text(
                    "Senilai Rp. ",
                    textScaleFactor: 1.0,
                    style: TextStyle(fontSize: normal),
                  ),
                  Obx(
                    () => Text(
                      controller.isSaldoVisible.value
                          ? formatter.addDot(dataController
                                  .currentSellPrice.value.price.price *
                              (controller.saldo.value.saldo != null
                                  ? controller.saldo.value.saldo!
                                  : 0))
                          : "*********",
                      textScaleFactor: 1.0,
                      style: TextStyle(fontSize: normal),
                    ),
                  )
                ]),
              ],
            ),
            IconButton(
                onPressed: () {
                  controller.toogleHideSaldo();
                },
                icon: Icon(
                  controller.isSaldoVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white,
                )),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Point",
                  textScaleFactor: 1.0,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GradientText(
                        child: Obx(
                      () => Text(
                        controller.isSaldoVisible.value
                            ? controller.userPoints.toString() + " poin"
                            : "******",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontSize: input, fontFamily: "MetroMedium"),
                      ),
                    ))),
              ],
            ),
            TextButton(
                onPressed: () {
                  tukarPoint();
                },
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(upperGradient1),
                            Color(middleGradient1),
                            Color(lowerGragdient1),
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Center(
                    child: Text(
                      "Tukar Poin",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: sm),
                    ),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
