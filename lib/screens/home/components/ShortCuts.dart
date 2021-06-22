import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';

class ShortCuts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn("images/buy.png", context, "Beli Emas"),
          _buildButtonColumn("images/sell.png", context, "Jual Emas"),
          _buildButtonColumn("images/transfer.png", context, "Transfer Emas")
        ],
      ),
    );
  }

  GestureDetector _buildButtonColumn(
      String image, BuildContext context, String label) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ("/" + label));
      },
      child: Center(
        child: Container(
          width: size.width * .3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(32, 45, 62, 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(child: Tab(icon: Image.asset(image)))),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: xm,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                    color: Color(background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
