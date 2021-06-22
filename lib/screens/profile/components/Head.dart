import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 250,
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
            Row(
              children: [
                Text(
                  "Profile Saya",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: header,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
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
            Text(
              "Mr. Subaidi",
              style: TextStyle(
                fontSize: name,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Color(upperGradient),
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                "Akun Terverifikasi",
                style: TextStyle(
                    color: Color(background), fontWeight: FontWeight.w500),
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
