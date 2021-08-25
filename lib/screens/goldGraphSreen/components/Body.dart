import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  @override
  _PromoBuildState createState() => _PromoBuildState();
}

class _PromoBuildState extends State<Body> {
  int selectedId = 0;
  @override
  Widget build(BuildContext context) {
    final newscontroller = Get.put(UserController());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            "Berita Terkini",
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
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.05),
                      spreadRadius: 10,
                      blurRadius: 2,
                      offset: Offset(2, 10))
                ]),
            child: Obx(() => newscontroller.loading.value != true
                ? newscontroller.goldNews.length > 0
                    ? SizedBox(
                        width: size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: newscontroller.goldNews.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                await canLaunch(
                                        newscontroller.goldNews[index].url)
                                    ? await launch(
                                        newscontroller.goldNews[index].url)
                                    : throw 'Could not launch $newscontroller.goldNews[index].url';
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(.05),
                                ))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(right: 10),
                                      constraints: BoxConstraints(maxWidth: 80),
                                      height: 60,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: FadeInImage.assetNetwork(
                                          image: newscontroller
                                              .goldNews[index].urlToImage
                                              .toString(),
                                          placeholder:
                                              'images/circular-progress.gif',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: size.width * .6,
                                          child: Text(
                                            newscontroller
                                                .goldNews[index].title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textScaleFactor: 1.0,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          width: size.width * .6,
                                          child: Text(
                                            newscontroller
                                                .goldNews[index].description,
                                            textScaleFactor: 1.0,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ))
                    : Container(
                        child: Text(
                        "Can't fetch news",
                        textScaleFactor: 1.0,
                        style: TextStyle(color: Color(background)),
                      ))
                : Container(
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
                        }))))
      ],
    ));
  }
}
