import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'components/body.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
            color: Color(background),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Pengaturan Akun",
                textScaleFactor: 1.0,
                style: TextStyle(fontFamily: "MetroBold"),
              ),
            )),
        // actions: [
        //   Center(
        //       child: Padding(
        //     padding: const EdgeInsets.only(right: 8.0),
        //     child: TextButton(
        //         onPressed: () {},
        //         child: Text(
        //           "Simpan",
        //           textScaleFactor: 1.0,
        //           style: TextStyle(color: Colors.white),
        //         )),
        //   ))
        // ],
      ),
      body: Body(),
    );
  }
}
