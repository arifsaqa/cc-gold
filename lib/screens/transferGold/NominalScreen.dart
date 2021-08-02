import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:learnUI/bindings/formater.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:learnUI/screens/sharedComponents/MyGradient.dart';
import 'package:learnUI/screens/transferGold/SetMessageScreen.dart';
import 'package:learnUI/screens/payments/PaymentScreen.dart';

class NominalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Title(
              color: Color(background),
              child: Text(
                "Nominal Transfer",
                textScaleFactor: 1.0,
                style: TextStyle(fontFamily: "MetroBold"),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [Head(), Body()],
          ),
        ),
      ),
    );
  }
}

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataTreeController>();
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
                Text("Harga jual Emas"),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GradientText(
                            child: Obx(() => Text(
                                  "Rp. " +
                                      formatter.addDot(controller
                                          .currentSellPrice.value.price.price),
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    fontSize: input,
                                    // color: Color(upperGradient),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))),
                        Text("/gram")
                      ],
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Kamis",
                  textScaleFactor: 1.0,
                  style: TextStyle(color: Colors.white, fontSize: sm),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    "10 Juni 2021",
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.white, fontSize: sm),
                  ),
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}

// class Body extends StatefulWidget {
//   @override
//   _PromoBuildState createState() => _PromoBuildState();
// }

class Body extends StatelessWidget {
  final List<int> multiplice = [1, 2, 5, 10, 50, 100];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();
    final priceGetter = Get.find<DataTreeController>();
    final formatter = Get.find<Formatter>();

    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - 230,
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
                    height: 300,
                    width: size.width,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (150 / 73),
                        ),
                        itemCount: multiplice.length,
                        itemBuilder: (context, index) => Obx(() =>
                            GestureDetector(
                              onTap: () {
                                controller.setSelectedPrice(
                                    index, priceGetter.sellPriceL.value.price);
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
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 0),
                                      colors: [
                                        Color(controller.selectedIndex == index
                                            ? upperGradient
                                            : 0XFFFFF),
                                        Color(controller.selectedIndex == index
                                            ? lowerGradient
                                            : 0XFFFFF)
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
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            "Rp. " +
                                                formatter.addDot(
                                                    multiplice[index] *
                                                        priceGetter.sellPriceL
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
                          (multiplice[controller.selectedIndex.value])
                                  .toString() +
                              " gram",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: normal,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to<void>(SetMessage());
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
