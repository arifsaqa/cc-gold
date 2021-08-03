import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:learnUI/bindings/formater.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/constants/urls.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/controllers/app_data/payment_method_controller.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:learnUI/screens/chooseBank/chooseBankScreen.dart';
import 'package:learnUI/screens/successPayment/successPaymentScreen.dart';
import 'package:learnUI/screens/welcome/password.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int bankIndex = 0;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final paymentMethodController = Get.find<PaymentMethodController>();
    final transactionController = Get.find<TransactionController>();
    final controller = Get.find<DataTreeController>();
    final formatter = Get.find<Formatter>();
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          text: transactionController.transactionType.value == 1
                              ? 'Beli'
                              : 'Jual',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(priceLabel),
                              fontSize: normal,
                              fontFamily: 'MetroReg'),
                          children: [
                            TextSpan(
                              text: ' Emas ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(priceLabel),
                                  fontSize: normal,
                                  fontFamily: 'MetroReg'),
                            ),
                            TextSpan(
                              text: transactionController.gram.toString() +
                                  " gram",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(priceLabel),
                                  fontSize: normal,
                                  fontFamily: 'MetroReg'),
                            ),
                          ]),
                    ),
                    RichText(
                      textScaleFactor: 1.0,
                      text: TextSpan(
                          text: "Harga Emas : ",
                          style: TextStyle(
                              color: Color(priceLabel),
                              fontSize: sm,
                              fontFamily: "MetroReg"),
                          children: [
                            TextSpan(
                              text: transactionController
                                          .transactionType.value ==
                                      0
                                  ? "Rp. " +
                                      formatter.addDot(
                                          controller.buyPriceL.value.price)
                                  : "Rp. " +
                                      formatter.addDot(
                                          controller.buyPriceL.value.price),
                              style: TextStyle(
                                  color: Color(priceLabel),
                                  fontSize: sm,
                                  fontFamily: "MetroReg"),
                            ),
                            TextSpan(
                              text: "/gram",
                              style: TextStyle(
                                  color: Color(priceLabel),
                                  fontSize: sm,
                                  fontFamily: "MetroReg"),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              Container(
                height: 120,
                width: 327,
                padding:
                    EdgeInsets.only(left: 14, right: 14, bottom: 22, top: 22),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nominal",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        ),
                        Text(
                          "Rp. " +
                              formatter
                                  .addDot(transactionController.getTotal.value),
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Biaya Admin",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        ),
                        Text(
                          "Rp 0",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        ),
                        Text(
                          "Rp. " +
                              formatter
                                  .addDot(transactionController.getTotal.value),
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _awaitBankChoice(context);
                },
                child: Container(
                    height: 100,
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
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Metode Pembayaran",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontSize: normal, color: Colors.black)),
                              Row(children: [
                                Obx(
                                  () => Container(
                                      width: 33,
                                      height: 20,
                                      child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'images/circular-progress.gif',
                                          image: base_url +
                                              '/' +
                                              paymentMethodController
                                                  .paymentMethod[bankIndex]
                                                  .logo)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Obx(
                                  () => Text(
                                    paymentMethodController
                                        .paymentMethod[bankIndex].name,
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'MetroMedium'),
                                  ),
                                )
                              ]),
                            ],
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    )),
              )
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
                              transactionController.transactionType.value != 1
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
                          padding: MaterialStateProperty.all(EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
        ],
      ),
    );
  }

  void _awaitBankChoice(BuildContext context) async {
    final result = await Navigator.push<int>(
        context,
        MaterialPageRoute<int>(
          builder: (context) => ChooseBankScreen(),
        ));

    setState(() {
      if (result != null) {
        bankIndex = result;
      }
    });
  }
}
