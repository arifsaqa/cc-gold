import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/constants/urls.dart';
import 'package:learnUI/controllers/promoController.dart';
import 'package:shimmer/shimmer.dart';

class PromosBuild extends StatefulWidget {
  @override
  _PromoBuildState createState() => _PromoBuildState();
}

class _PromoBuildState extends State<PromosBuild> {
  int selectedId = 0;
  PromoController controller = Get.put(PromoController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _getPromo();
    });
  }

  @override
  void dispose() {
    super.dispose();
    // controller.dispose();
  }

  void _getPromo() async {
    await controller.getPromoFunction();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 10),
              child: Text(
                "Promo Hari Ini",
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Color.fromRGBO(32, 45, 62, 0.5),
                    fontSize: sm,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Obx(() => controller.loading.value
                  ? Container(
                      width: size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
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
                          }))
                  : Container(
                      width: size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.promo.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                width: 327,
                                height: 110,
                                decoration: BoxDecoration(
                                    color: Color(background),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.all(22.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          controller.promo[index].description !=
                                                  null
                                              ? Text(
                                                  controller.promos.value
                                                      .promos[index].title
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textScaleFactor: 1.0,
                                                  style: TextStyle(
                                                      color:
                                                          Color(upperGradient),
                                                      fontSize: normal),
                                                )
                                              : Center(
                                                  heightFactor: 1.5,
                                                  child: Text(
                                                    controller.promos.value
                                                        .promos[index].title
                                                        .toString(),
                                                    textScaleFactor: 1.0,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Color(
                                                            upperGradient),
                                                        fontSize: normal),
                                                  ),
                                                ),
                                          SizedBox(height: 4),
                                          controller.promo[index].description !=
                                                  null
                                              ? Text(
                                                  controller.promos.value
                                                      .promos[index].description
                                                      .toString(),
                                                  textScaleFactor: 1.0,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: xm))
                                              : Text(
                                                  "",
                                                  textScaleFactor: 1.0,
                                                  style: TextStyle(fontSize: 0),
                                                )
                                        ],
                                      ),
                                    )),
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                      child: Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 120),
                                        height: double.infinity,
                                        child: FadeInImage.assetNetwork(
                                          image: base_url +
                                              '/' +
                                              controller.promo[index].image
                                                  .toString(),
                                          placeholder:
                                              'images/circular-progress.gif',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )),
            )
          ],
        ),
      ),
    );
  }
}

Shimmer buildPromoShimmer() {
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
        width: 327,
        height: 150,
      ));
}
