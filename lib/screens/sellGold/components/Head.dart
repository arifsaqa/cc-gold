import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/bindings/formater.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/screens/sharedComponents/MyGradient.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataTreeController>();
    final userController = Get.find<UserController>();
    final formatter = Get.find<Formatter>();
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width,
      padding: EdgeInsets.only(right: 24, left: 24),
      decoration: BoxDecoration(
        color: Color(background),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Harga jual Emas",
                  textScaleFactor: 1.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GradientText(
                            child: Obx(() => Text(
                                  "Rp. " +
                                      formatter.addDot(
                                          controller.sellPriceL.value.price),
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    fontSize: header,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))),
                        Text(
                          "/gram",
                          textScaleFactor: 1.0,
                        )
                      ],
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Obx(() => Text(
                      userController.day,
                      textScaleFactor: 1.0,
                      style: TextStyle(color: Colors.white, fontSize: sm),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Obx(() => Text(
                        userController.today,
                        textScaleFactor: 1.0,
                        style: TextStyle(color: Colors.white, fontSize: sm),
                      )),
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}
