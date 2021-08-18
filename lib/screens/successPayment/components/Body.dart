import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:learnUI/bindings/formater.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/controllers/app_data/payment_method_controller.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/models/transactionType.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:learnUI/screens/successPayment/components/Separator.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  String getLabelOrTitle(int type) {
    switch (type) {
      case 1:
        return "Pembelian";
      case 2:
        return "Penjualan";
      default:
        return "Transfer";
    }
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethodController = Get.find<PaymentMethodController>();
    final usercontroller = Get.find<UserController>();
    final transactionController = Get.find<TransactionController>();
    final controller = Get.find<DataTreeController>();
    final formatter = Get.find<Formatter>();
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 26, bottom: 26),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.05),
                  spreadRadius: 10,
                  blurRadius: 2,
                  offset: Offset(2, 10))
            ]),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 58,
                    width: 58,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          painter: Painter(),
                        ),
                        Icon(
                          Icons.pending_actions,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Text(
                    getLabelOrTitle(
                            transactionController.transactionType.value) +
                        " Emas",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        fontSize: header,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                const MySeparator(
                  color: Color.fromRGBO(151, 151, 151, 1),
                  height: 1,
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
            Row(children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => RichText(
                        textScaleFactor: 1.0,
                        text: TextSpan(
                            text: getLabelOrTitle(
                                transactionController.transactionType.value),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(priceLabel),
                                fontSize: normal,
                                fontFamily: "MetroReg"),
                            children: [
                              TextSpan(
                                text: ' Emas ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(priceLabel),
                                    fontSize: normal,
                                    fontFamily: "MetroReg"),
                              ),
                              TextSpan(
                                text: transactionController.gram.toString() +
                                    " gram",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(priceLabel),
                                    fontSize: normal,
                                    fontFamily: "MetroReg"),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => RichText(
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
                                        1
                                    ? "Rp. " +
                                        formatter.addDot(
                                            controller.buyPriceL.value.price)
                                    : "Rp. " +
                                        formatter.addDot(
                                            controller.sellPriceL.value.price),
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
                      ),
                    )
                  ],
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.only(top: 26),
              height: 120,
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transactionController.transactionType.value == 3
                              ? "Jumlah"
                              : "Nominal",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        ),
                        Text(
                          "Rp. " +
                              formatter
                                  .addDot(transactionController.getTotal.value),
                          // typeId == 2 ? label : price,
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        )
                      ],
                    ),
                    transactionController.transactionType.value == 3
                        ? SizedBox(
                            height: 0,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Biaya Admin",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: sm),
                              ),
                              Text(
                                "Rp " +
                                    transactionController.adminfee.value
                                        .toString(),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: sm),
                              )
                            ],
                          ),
                    transactionController.transactionType.value == 3
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "No Tujuan",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(priceLabel),
                                    fontSize: normal),
                              ),
                              Text(
                                transactionController.destinationNumber.value
                                    .toString(),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(priceLabel),
                                    fontSize: normal),
                              ),
                              Text("a/n " + usercontroller.user.value.name,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      height: 1.5, color: Color(priceLabel))),
                              Text(
                                  "Pesan : " +
                                      transactionController.message.value
                                          .toString(),
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      height: 1.5, color: Color(priceLabel))),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: sm),
                              ),
                              Text(
                                "Rp. " +
                                    formatter.addDot(transactionController
                                            .adminfee.value +
                                        transactionController.getTotal.value),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: sm),
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            const MySeparator(
              color: Color.fromRGBO(151, 151, 151, 1),
              height: 1,
            ),
            SizedBox(
              height: 22,
            ),
            Obx(() => (BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: transactionController.barcode.value,
                  height: 67,
                ))),
            Obx(() => Text(
                  "No Pref " + transactionController.barcode.value,
                  textScaleFactor: 1.0,
                  style: TextStyle(color: Colors.black, fontSize: sm),
                ))
          ],
        ),
      ),
      Positioned(
          top: 10,
          right: 20,
          child: InkWell(
            onTap: () {
              transactionController.resetVariables();
              Get.toNamed<void>('/logged');
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color(upperGradient),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(8))),
              child: Image.asset(
                "images/navs/homeActive.png",
                width: 25,
                height: 25,
              ),
            ),
          ))
    ]);
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 25.0;
    canvas.translate(size.width / 2, size.height / 2);
    Offset center = Offset(0.0, 0.0);
    // draw shadow first
    Path oval = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius + 10));
    Paint shadowPaint = Paint()
      ..color = Colors.yellowAccent.withOpacity(0.8)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 50);
    canvas.drawPath(oval, shadowPaint);
    // draw circle
    Paint thumbPaint = Paint()
      ..color = Colors.yellow[700]!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, thumbPaint);
  }

  @override
  bool shouldRepaint(Painter oldDelegate) {
    return false;
  }
}
