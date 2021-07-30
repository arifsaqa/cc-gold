import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/screens/payments/PaymentScreen.dart';

class Body extends StatelessWidget {
  final List<int> multiplice = [1, 2, 5, 10, 50, 100];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataTreeController>();
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
                        itemBuilder: (context, index) => Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.setSelectedPrice(
                                      index,
                                      (controller.buyPrice[0].price *
                                          multiplice[
                                              controller.selectedIndex.value]));
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
                                          Color(
                                              controller.selectedIndex == index
                                                  ? upperGradient
                                                  : 0XFFFFF),
                                          Color(
                                              controller.selectedIndex == index
                                                  ? middleGradient
                                                  : 0XFFFFF),
                                          Color(
                                              controller.selectedIndex == index
                                                  ? lowerGradient
                                                  : 0XFFFFF),
                                        ]),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                  (controller.sellPrice[0]
                                                              .price *
                                                          (multiplice[index]))
                                                      .toString(),
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
                              ),
                            ))),
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
                          "Rp. " +
                              (controller.sellPrice[0].price *
                                      (multiplice[
                                          controller.selectedIndex.value]))
                                  .toString(),
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
                    Navigator.push<TransationData>(
                        context,
                        MaterialPageRoute<TransationData>(
                            builder: (context) => PaymentScreen(
                                  label:
                                      multiplice[controller.selectedIndex.value]
                                          .toString(),
                                  price:
                                      controller.selectedPrice.value.toString(),
                                  typeId: 1,
                                )));
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
