import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/screens/wallet/components/Body.dart';
import 'package:learnUI/screens/wallet/components/Head.dart';

class WalletScreen extends StatelessWidget {
  final controller = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: Obx(
        () => Stack(children: [
          Column(
            children: [
              SizedBox(height: 200, child: Head()),
              Expanded(child: Body())
            ],
          ),
          Container(
            height: controller.loadingPoint.value ? size.height : 0,
            width: controller.loadingPoint.value ? size.width : 0,
            color: Colors.black.withOpacity(0.5),
            child: SpinKitCircle(
              color: Color(background),
            ),
          ),
        ]),
      ),
    );
  }
}
