import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:learnUI/screens/faq_policy_screen/faq.dart';
import 'package:learnUI/screens/profile/profileSetting/profileSettingScreen.dart';
import 'package:learnUI/sharedPreferrences/userLocal.dart';

class Setting {
  final String image, title;
  final int id;

  Setting({required this.image, required this.title, required this.id});
}

List<Setting> settings = [
  Setting(
    id: 1,
    title: "Pengaturan Akun",
    image: "images/setting.png",
  ),
  Setting(
    id: 2,
    title: "FAQ",
    image: "images/faq.png",
  ),
  Setting(
    id: 3,
    title: "Syarat dan Kebijakan",
    image: "images/syaratkebijakan.png",
  ),
  Setting(
    id: 4,
    title: "Beri Ulasan",
    image: "images/star.png",
  ),
  Setting(
    id: 5,
    title: "Logout Akun",
    image: "images/logout.png",
  ),
];

//  int cok = await cek.getUserId();
//  int i = await controller.getUserById(isSignin);
class Body extends StatefulWidget {
  _StateBody createState() => _StateBody();
}

class _StateBody extends State<Body> {
  final controller = Get.find<UserController>();
  final transactionController = Get.find<TransactionController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      LocalUser cek = LocalUser();
      int cok = await cek.getUserId();
      print('userId' + cok.toString());
      // if (cok == 1) {
      await controller.getUserById(cok);
      // }
    });
  }

  void confirmLogout() {
    Get.defaultDialog(
      title: "Keluar?",
      titlePadding: EdgeInsets.only(top: 20),
      contentPadding: EdgeInsets.symmetric(vertical: 20),
      middleText: "Anda yakin ingin keluar?",
      backgroundColor: Color(background),
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
      confirm: TextButton(
          onPressed: () async {
            await controller.logout();
            Get.back();
            Get.offAllNamed('/login');
            transactionController.resetTransactionStates();
          },
          child: Text(
            "Ya",
            style: TextStyle(color: Colors.white),
          )),
      cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Tidak",
            style: TextStyle(color: Color(upperGradient)),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: settings.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 62.5,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () async {
                      switch (index) {
                        case 0:
                          print("oke");
                          Get.to(ProfileSettingScreen());
                          break;
                        case 1:
                          Get.to(FaqScreen());
                          break;
                        case 2:
                          Get.defaultDialog(
                              content: Text(
                            "(　＾∇＾)",
                            style: TextStyle(color: Color(background)),
                          ));
                          break;
                        case 3:
                          Get.defaultDialog(
                              content: Text(
                            "(　＾∇＾)",
                            style: TextStyle(color: Color(background)),
                          ));
                          break;
                        case 4:
                          confirmLogout();
                          break;
                        default:
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: 1.0,
                        color: Colors.grey.withOpacity(.05),
                      ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(0),
                              child: Image.asset(settings[index].image),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(38, 51, 70, .1),
                                  borderRadius: BorderRadius.circular(8)),
                              height: 40,
                              width: 40,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    settings[index].title,
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        color: index == settings.length - 1
                                            ? Colors.black26
                                            : Colors.black,
                                        fontWeight: FontWeight.w600),
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
            ),
          ),
        ]);
  }
}
