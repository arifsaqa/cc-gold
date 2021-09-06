import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/constants/urls.dart';
import 'package:learnUI/controllers/userController.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width,
      padding: EdgeInsets.only(
          top: size.height * .01, right: 24, left: 24, bottom: 20),
      decoration: BoxDecoration(
        color: Color(background),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HeadBody(),
          ],
        ),
      ),
    );
  }
}

class HeadBody extends StatefulWidget {
  @override
  _HeadBodyState createState() => _HeadBodyState();
}

class _HeadBodyState extends State<HeadBody> {
  var _image;

  Widget pickImage() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(background),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      height: 100,
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              ImagePicker imagePicker = new ImagePicker();
              XFile? image = await imagePicker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 50,
                  preferredCameraDevice: CameraDevice.rear);
              print(image!.path);
              setState(() {
                _image = File(image.path);
              });
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color(upperGradient),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Text("Pick Image"),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                    controller.user.value.name,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: name,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 5),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(upperGradient),
                          Color(middleGradient),
                          Color(lowerGradient),
                        ]),
                    borderRadius: BorderRadius.circular(4)),
                child: Obx(
                  () => Text(
                    controller.user.value.isVerified == 1 ||
                            controller.user.value.isVerified != 0
                        ? "Akun Terverifikasi"
                        : "Akun Belum Terverifikasi",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontFamily: "MetroMedium",
                      color: Color(background),
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              showBottomSheet(
                  context: context, builder: (context) => pickImage());
            },
            child: CircleAvatar(
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        _image,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ))
                  : FadeInImage.assetNetwork(
                      image: base_url + '/' + controller.user.value.image,
                      imageErrorBuilder: (BuildContext context,
                          Object exception, StackTrace? stackTrace) {
                        return Text("${controller.user.value.name[0]}");
                      },
                      placeholder: 'images/profile.png',
                      fit: BoxFit.cover,
                    ),
              minRadius: 20,
              maxRadius: 33,
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

enum ImageSourceType { gallery, camera }
