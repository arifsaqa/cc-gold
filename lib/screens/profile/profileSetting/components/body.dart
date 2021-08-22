import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Container(
      child: Row(
        children: [
          CircleAvatar(
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
                    imageErrorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('ʕ•́ᴥ•̀ʔ');
                    },
                    placeholder: 'images/profile.png',
                    fit: BoxFit.cover,
                  ),
            minRadius: 20,
            maxRadius: 33,
            backgroundColor: Colors.white,
          ),
          Column(children: [

          ],)
        ],
      ),
    );
  }
}
