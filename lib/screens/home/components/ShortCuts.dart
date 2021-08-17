import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/screens/Test/Verify.dart';
import 'package:learnUI/screens/buyGold/BuyGoldScreen.dart';
import 'package:learnUI/screens/transferGold/TransferGoldScreen.dart';
import 'package:learnUI/screens/sellGold/SellGoldScreen.dart';

class ShortCuts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn("images/buy.png", context, "Beli Emas", BuyGold()),
          _buildButtonColumn(
              "images/sell.png", context, "Jual Emas", SellGoldScreen()),
          _buildButtonColumn(
              "images/transfer1.png", context, "Transfer Emas", TransferGold())
        ],
      ),
    );
  }

  GestureDetector _buildButtonColumn(
      String image, BuildContext context, String label, Widget destination) {
    Size size = MediaQuery.of(context).size;
    var userController = Get.find<UserController>();

    return GestureDetector(
      onTap: () {
        userController.user.value.isVerified == 0
            ? Get.defaultDialog(
                title: "",
                middleText: "Verifikasi akun anda untuk melakukan transaksi",
                backgroundColor: Color(background),
                titleStyle: TextStyle(color: Colors.white),
                middleTextStyle: TextStyle(color: Colors.white),
                confirm: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.green)),
                    onPressed: () {
                      Get.back();
                      Get.to(VerifyPhone(
                          title: "Verifikasi",
                          description: "Verifikasi nomor hp anda",
                          onClick: 'ha'));
                    },
                    child: Text("Verif akun")),
                cancel: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.yellow)),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Nanti",
                      style: TextStyle(color: Color(background)),
                    )),
              )
            : Navigator.push<void>(
                context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Center(
        child: Container(
          width: size.width * .3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(32, 45, 62, 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(child: Tab(icon: Image.asset(image)))),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  label,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: xm,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                    color: Color(background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
