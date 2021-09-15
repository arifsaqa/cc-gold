import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learnUI/bindings/formater.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/screens/payments/PaymentScreen.dart';

class Body extends StatefulWidget {
  @override
  _StateBody createState() => _StateBody();
}

class _StateBody extends State<Body> {
  final TextEditingController customPriceController = TextEditingController();
  int customPrice = 0;
  final multiplice = [1, 2, 5, 10, 50, 100];
  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();
    final priceGetter = Get.find<DataTreeController>();
    final formatter = Get.find<Formatter>();
    final usercontroller = Get.find<UserController>();

    Size size = MediaQuery.of(context).size;
    return Container(
      // height: size.height - 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, bottom: 0, top: 24),
                child: Text(
                  "Pilih Emas",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: Color.fromRGBO(32, 45, 62, 0.5),
                      fontSize: sm,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                    // height: 300,
                    width: size.width,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (150 / 73),
                        ),
                        itemCount: multiplice.length,
                        itemBuilder: (context, index) => Obx(() =>
                            GestureDetector(
                              onTap: () {
                                controller.setSelectedPrice(
                                    index, priceGetter.buyPriceL.value.price);
                              },
                              child: Container(
                                height: 10,
                                width: 160,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
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
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(controller.selectedIndex.value ==
                                                    index &&
                                                customPrice <= 0
                                            ? upperGradient
                                            : 0XFFFFF),
                                        Color(controller.selectedIndex.value ==
                                                    index &&
                                                customPrice <= 0
                                            ? middleGradient
                                            : 0XFFFFF),
                                        Color(controller.selectedIndex.value ==
                                                    index &&
                                                customPrice <= 0
                                            ? lowerGradient
                                            : 0XFFFFF),
                                      ]),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            multiplice[index].toString() +
                                                " gram",
                                            textScaleFactor: 1.0,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Color(priceLabel),
                                                fontSize: normal),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Rp. " +
                                                formatter.addDot(
                                                    multiplice[index] *
                                                        priceGetter.buyPriceL
                                                            .value.price),
                                            textScaleFactor: 1.0,
                                            style: TextStyle(
                                                color: Color(price),
                                                fontSize: xm),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )))),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, bottom: 0, top: 24),
                child: Text(
                  "Custom Nominal",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: Color.fromRGBO(32, 45, 62, 0.5),
                      fontSize: sm,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextField(
                            controller: customPriceController,
                            onChanged: (string) {
                              string = string.length > 0
                                  ? '${_formatNumber(string.replaceAll(',', ''))}'
                                  : '';
                              setState(() {
                                customPrice = string.length > 0
                                    ? int.parse(string.replaceAll(',', ''))
                                    : 0;
                              });
                              if (customPrice >
                                  priceGetter.buyPriceL.value.price) {
                                Get.snackbar("Perhatian!",
                                    "Kami sarankan pilih harga yang disediakan",
                                    colorText: Colors.yellow[500]);
                              }
                              controller.getTotal.value = customPrice;
                              controller.gram.value = double.parse(
                                  (customPrice /
                                          priceGetter.buyPriceL.value.price)
                                      .toStringAsFixed(4));
                              customPriceController.value = TextEditingValue(
                                text: string,
                                selection: TextSelection.collapsed(
                                    offset: string.length),
                              );
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText:
                                    'Masukkan nominal(rupiah) sesuai dompet anda'),
                            style: TextStyle(
                                fontSize: sm, color: Color(background))),
                      ),
                      customPrice > 0
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Gram :",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Obx(() => Text(
                                      controller.gram.value.toStringAsFixed(4) +
                                          " gram",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: normal,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            )
                          : Container()
                      // ElevatedButton(
                      //   onPressed: () {
                      //     controller.getTotal.value = customPrice;
                      //   },
                      //   child: Text(
                      //     "Oke",
                      //     textScaleFactor: 1.0,
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: sm,
                      //         fontWeight: FontWeight.w600),
                      //   ),
                      //   style: ButtonStyle(
                      //     padding: MaterialStateProperty.all(EdgeInsets.only(
                      //         left: 20, right: 20, top: 15, bottom: 15)),
                      //     shape:
                      //         MaterialStateProperty.all<RoundedRectangleBorder>(
                      //             RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8.0),
                      //     )),
                      //     backgroundColor:
                      //         MaterialStateProperty.all(Color(background)),
                      //   ),
                      // )
                    ],
                  ))
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
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
                    Obx(() => Text(
                          "Rp. " + formatter.addDot(controller.getTotal.value),
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: normal,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.priceId.value = priceGetter.buyPriceL.value.id;
                    controller.transactionType.value = 1;
                    controller.destinationNumber.value = '';
                    controller.message.value = '';
                    controller.setBarcode(
                        DateFormat("ymdhs").format(usercontroller.now.value) +
                            (1 + priceGetter.buyPriceL.value.id).toString());
                    print(controller.transactionType);
                    Get.off(PaymentScreen());
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
        ],
      ),
    );
  }
}
