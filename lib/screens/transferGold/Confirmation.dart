import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:learnUI/bindings/formater.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:learnUI/screens/successPayment/successPaymentScreen.dart';
import 'package:learnUI/screens/welcome/password.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Confirmation extends GetWidget {
  const Confirmation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Text(
              "Detail Transfer",
              textScaleFactor: 1.0,
              style: TextStyle(fontFamily: "MetroBold"),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Container(child: Body())],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int bankIndex = 0;
  @override
  Widget build(BuildContext context) {
    final transactionController = Get.find<TransactionController>();
    final priceGetter = Get.find<DataTreeController>();
    final formatter = Get.find<Formatter>();
    final usercontroller = Get.find<UserController>();

    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height - 80,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 90,
                    width: 327,
                    padding: EdgeInsets.only(left: 14, bottom: 22, top: 22),
                    margin: EdgeInsets.only(left: 24, right: 24, top: 50),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.08),
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          textScaleFactor: 1.0,
                          text: TextSpan(
                              text: 'Transfer ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(priceLabel),
                                  fontFamily: "MetroReg",
                                  fontSize: normal),
                              children: [
                                TextSpan(
                                  text: 'Emas ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(priceLabel),
                                      fontFamily: "MetroReg",
                                      fontSize: normal),
                                ),
                                TextSpan(
                                  text: transactionController.gram.toString() +
                                      ' gram',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "MetroReg",
                                      color: Color(priceLabel),
                                      fontSize: normal),
                                ),
                              ]),
                        ),
                        RichText(
                          textScaleFactor: 1.0,
                          text: TextSpan(
                              text: "Harga Emas : ",
                              style: TextStyle(
                                  fontFamily: "MetroReg",
                                  color: Color(priceLabel),
                                  fontSize: sm),
                              children: [
                                TextSpan(
                                  text: "Rp. " +
                                      formatter.addDot(
                                          priceGetter.sellPriceL.value.price),
                                  style: TextStyle(
                                      fontFamily: "MetroReg",
                                      color: Color(priceLabel),
                                      fontSize: sm),
                                ),
                                TextSpan(
                                  text: "/gram",
                                  style: TextStyle(
                                      fontFamily: "MetroReg",
                                      color: Color(priceLabel),
                                      fontSize: sm),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 327,
                    padding: EdgeInsets.only(left: 14, bottom: 22, top: 22),
                    margin: EdgeInsets.only(left: 24, right: 24, top: 50),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.08),
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "No Tujuan",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              height: 1,
                              fontWeight: FontWeight.w500,
                              color: Color(priceLabel),
                              fontSize: normal),
                        ),
                        Text(
                          transactionController.destinationNumber.value,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              height: 1,
                              fontWeight: FontWeight.w600,
                              color: Color(priceLabel),
                              fontSize: normal),
                        ),
                        Text("a/n " + usercontroller.user.value.name,
                            textScaleFactor: 1.0,
                            style:
                                TextStyle(height: 1, color: Color(priceLabel))),
                        Text("Pesan : " + transactionController.message.value,
                            textScaleFactor: 1.0,
                            style:
                                TextStyle(height: 1, color: Color(priceLabel))),
                      ],
                    ),
                  ),
                ],
              ),
              Obx(() => (LoaderOverlay(
                    useDefaultLoading: false,
                    overlayWidget: Center(
                      child: SpinKitCubeGrid(
                        color: Color(background),
                        size: 40,
                      ),
                    ),
                    child: Container(
                      height: 96,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total :",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Rp. " +
                                    formatter.addDot(
                                        transactionController.getTotal.value),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: normal,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              transactionController.loading.value = true;
                              context.loaderOverlay.show();
                              await transactionController.createTransation();
                              if (transactionController.loading.value) {
                                context.loaderOverlay.hide();
                              }
                              Get.to(
                                  transactionController.transactionType.value !=
                                          1
                                      ? Password(
                                          isLoggingin: false,
                                          redirecto: SuccessPaymentScreen())
                                      : SuccessPaymentScreen());
                            },
                            child: Text(
                              "Konfirmasi",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sm,
                                  fontWeight: FontWeight.w600),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 15,
                                      bottom: 15)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(background)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))),
            ]));
  }
}
