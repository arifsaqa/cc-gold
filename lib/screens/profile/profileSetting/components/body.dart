import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/urls.dart';
import 'package:learnUI/controllers/userController.dart';

class Body extends StatefulWidget {
  _StateBody createState() => _StateBody();
}

class _StateBody extends State<Body> {
  var _image;
  final controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
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
                height: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(upperGradient),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Text(
                    "Upload Foto",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Color(background), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Column(
              children: [],
            )
          ],
        ),
      );
    }

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
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
                  : Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(background)),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: FadeInImage.assetNetwork(
                          image: base_url + '/' + controller.user.value.image,
                          imageErrorBuilder: (BuildContext context,
                              Object exception, StackTrace? stackTrace) {
                            return Center(child: const Text('ʕ•́ᴥ•̀ʔ'));
                          },
                          placeholder: 'images/profile.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              minRadius: 20,
              maxRadius: 33,
              backgroundColor: Colors.white,
            ),
          ),
          Center(
            child: TextButton(
              child: Text(
                "Ganti Foto Profil",
                textScaleFactor: 1.0,
                style: TextStyle(color: Color(background)),
              ),
              onPressed: () {
                showBottomSheet(
                    context: context, builder: (context) => pickImage());
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildColumn(
                  context: context,
                  icon: Icons.person,
                  label: "Nama",
                  value: controller.user.value.name),
              buildColumn(
                  context: context,
                  icon: Icons.mail,
                  label: "Nama",
                  value: controller.user.value.email),
              buildColumn(
                  context: context,
                  icon: Icons.credit_card,
                  label: "Nama",
                  value: controller.user.value.phone),
              buildColumn(
                  context: context,
                  icon: Icons.credit_card,
                  label: "No Rekening",
                  value: controller.userBankAccount.value.bankAccounts)
            ],
          )
        ],
      ),
    );
  }
}

Widget buildColumn({
  required BuildContext context,
  required IconData icon,
  required String label,
  dynamic value,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    child: value.runtimeType == String
        ? Row(
            children: [
              Icon(
                icon,
                color: Color(lowerGradient),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  value,
                  style: TextStyle(color: Color(background)),
                ),
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No Rekening :",
                textScaleFactor: 1.0,
                style: TextStyle(color: Color(background)),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            (index + 1).toString() + ". ",
                            textScaleFactor: 1.0,
                            style: TextStyle(color: Color(background)),
                          ),
                          Text(
                            value[index].numberAccount,
                            style: TextStyle(color: Color(background)),
                          )
                          
                        ],
                      ),
                    );
                  })
            ],
          ),
  );
}
