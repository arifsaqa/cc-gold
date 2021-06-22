import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .35,
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
                  "Dompet Emas",
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
            Text("Saldo Emas Kamu"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                display ? "2,000 gram" : "**********",
                style: TextStyle(
                    fontSize: input,
                    color: Color(upperGradient),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              "Senilai Rp. 1.080.000",
              style: TextStyle(fontSize: normal),
            )
          ],
        ),
        IconButton(
            onPressed: () {
              setState(() {
                display = !display;
              });
            },
            icon: Icon(
              display ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ))
      ],
    );
  }
}
