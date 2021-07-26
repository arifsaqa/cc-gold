import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
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
            Saldo(),
          ],
        ),
      ),
    );
  }
}

class Saldo extends StatefulWidget {
  @override
  _SaldoState createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  bool display = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetX<UserController>(
                init: UserController(),
                builder: (_) => Text(
                      _.userData.value.user!.name.toString(),
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: name,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
            // Text(
            //   "Mr. Subaidi",
            //   textScaleFactor: 1.0,
            //   style: TextStyle(
            //     fontSize: name,
            //     fontWeight: FontWeight.w600,
            //   ),
            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
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
              child: Text(
                "Akun Terverifikasi",
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: "MetroMedium",
                  color: Color(background),
                ),
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundImage: AssetImage('images/profile.png'),
          minRadius: 20,
          maxRadius: 33,
        )
      ],
    );
  }
}
