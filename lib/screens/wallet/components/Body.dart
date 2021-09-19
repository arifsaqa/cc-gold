import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:learnUI/screens/transactionDetail/TransactionDetail.dart';
import 'package:shimmer/shimmer.dart';

class Body extends StatefulWidget {
  @override
  _PromoBuildState createState() => _PromoBuildState();
}

class _PromoBuildState extends State<Body> {
  int selectedId = 0;
  var controller = Get.find<TransactionController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _getTransactions();
    });
  }

  String getLabelOrTitle(int type) {
    switch (type) {
      case 1:
        return "Pembelian";
      case 2:
        return "Penjualan";
      case 3:
        return "Transfer";
      default:
        return "Terima Transfer";
    }
  }

  Container getIcon(status) {
    switch (status) {
      case 1:
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.green[800],
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Icon(
            Icons.done_outline_outlined,
            size: 20,
            color: Colors.white,
          ),
        );
      case 2:
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.red[800],
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Icon(
            Icons.highlight_off,
            size: 20,
            color: Colors.white,
          ),
        );

      default:
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.yellow[800],
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Icon(
            Icons.pending_actions,
            size: 20,
            color: Colors.white,
          ),
        );
    }
  }

  void _getTransactions() async {
    await controller.getTransaction();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 24),
          child: Text(
            "Riwayat Transaksi",
            textScaleFactor: 1.0,
            style: TextStyle(
                color: Color.fromRGBO(32, 45, 62, 0.5),
                fontSize: sm,
                fontWeight: FontWeight.bold),
          ),
        ),
        Obx(
          () => controller.loading.value
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Shimmer(
                        gradient: LinearGradient(stops: [
                          0.4,
                          0.5,
                          0.6
                        ], colors: [
                          Color(lowerGradient),
                          Color(upperGradient),
                          Color(lowerGradient)
                        ]),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          width: 327,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(background),
                              borderRadius: BorderRadius.circular(8)),
                        ));
                  })
              : controller.transactions.value.data.length > 0
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.transactions.value.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print(controller
                                  .transactions.value.data[index].type);
                              Get.to(TransactionDetailScreen(
                                  data: controller
                                      .transactions.value.data[index]));
                            },
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(.05),
                                ))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Image.asset(controller
                                                      .transactions
                                                      .value
                                                      .data[index]
                                                      .type ==
                                                  1
                                              ? "images/sellGold.png"
                                              : "images/buyGold.png"),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              width: size.width * .6,
                                              child: Text(
                                                getLabelOrTitle(controller
                                                        .transactions
                                                        .value
                                                        .data[index]
                                                        .type) +
                                                    " Emas",
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Container(
                                              width: size.width * .6,
                                              child: Text(
                                                controller.getDay(controller
                                                    .transactions
                                                    .value
                                                    .data[index]
                                                    .getCreateAt),
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    getIcon(controller
                                        .transactions.value.data[index].status),
                                    // Container(
                                    //   padding: EdgeInsets.all(8),
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.yellow[800],
                                    //       borderRadius: BorderRadius.all(
                                    //           Radius.circular(50))),
                                    //   child: Icon(
                                    //     getIcon(controller.transactions.value
                                    //         .data[index].status),
                                    //     size: 20,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                    // controller.transactions.value.data[index]
                                    //             .status !=
                                    //         1
                                    //     ? Container(
                                    //         padding: EdgeInsets.all(8),
                                    //         decoration: BoxDecoration(
                                    //             color: Colors.yellow[800],
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(50))),
                                    //         child: Icon(
                                    //           Icons.pending_actions,
                                    //           size: 20,
                                    //           color: Colors.white,
                                    //         ),
                                    //       )
                                    //     : Container(
                                    //         padding: EdgeInsets.all(8),
                                    //         decoration: BoxDecoration(
                                    //             color: Colors.green,
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(50))),
                                    //         child: Icon(
                                    //           Icons.done_outline_rounded,
                                    //           size: 20,
                                    //           color: Colors.white,
                                    //         ),
                                    //       )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Text(
                          "Belum ada transaksi",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
        ),
        // )
      ],
    );
  }
}
