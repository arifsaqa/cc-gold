import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
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

class Saldo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<UserController>();
    var dataController = Get.put(DataTreeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Saldo Emas Kamu"),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: GradientText(
                    child: Obx(
                  () => Text(
                    controller.isSaldoVisible.value
                        ? controller.saldo.value.saldo != null
                            ? controller.saldo.value.saldo!.gram.toString() +
                                " gram"
                            : "0 gram"
                        : "**********",
                    textScaleFactor: 1.0,
                    style:
                        TextStyle(fontSize: input, fontFamily: "MetroMedium"),
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
                      ? (dataController.currentSellPrice.value.price.price *
                              (controller.saldo.value.saldo != null
                                  ? controller.saldo.value.saldo!.gram
                                  : 0))
                          .toString()
                      : "*********",
                  textScaleFactor: 1.0,
                  style: TextStyle(fontSize: normal),
                ),
              )
            ])
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
            ))
      ],
    );
  }
}
