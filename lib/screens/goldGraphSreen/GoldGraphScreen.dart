import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/screens/goldGraphSreen/components/Head.dart';
import 'package:learnUI/screens/goldGraphSreen/components/Body.dart';

class GoldGraphScreen extends StatelessWidget {
  final controller = Get.find<DataTreeController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Grafik Emas",
                textScaleFactor: 1.0,
                style: TextStyle(fontFamily: "MetroBold"),
              ),
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Color(background),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Stack(children: [
            Column(
              children: [
                Head(),
                Body(),
              ],
            ),
            Container(
              height: controller.loading.value ? size.height : 0,
              width: controller.loading.value ? size.width : 0,
              color: Colors.black.withOpacity(0.5),
              child: SpinKitCircle(
                color: Color(upperGradient),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
