import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/constants/urls.dart';
import 'package:learnUI/controllers/app_data/payment_method_controller.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:shimmer/shimmer.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentMethodController = Get.find<PaymentMethodController>();
    final transactionController = Get.find<TransactionController>();
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
        ),
        child: Obx(
          () => Container(
              // height: 370,
              child: paymentMethodController.loading.value
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
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
                                  vertical: 10, horizontal: 20),
                              width: 327,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Color(background),
                                  borderRadius: BorderRadius.circular(8)),
                            ));
                      })
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: paymentMethodController.paymentMethod.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            transactionController.payment.value =
                                paymentMethodController.paymentMethod[index].id;
                            Navigator.pop(context, index);
                          },
                          child: Container(
                            height: 70,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey.withOpacity(.05),
                                      ),
                                      top: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey.withOpacity(.05),
                                      ))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(13),
                                          height: 58,
                                          width: 58,
                                          child: FadeInImage.assetNetwork(
                                            image: paymentMethodController
                                                .paymentMethod[index].logo,
                                            placeholder:
                                                'images/circular-progress.gif',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Text(
                                                paymentMethodController
                                                    .paymentMethod[index].name,
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: sm,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                  Icon(
                                    Icons.chevron_right,
                                    size: 30,
                                    color: Color(light),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )),
        ));
  }
}
