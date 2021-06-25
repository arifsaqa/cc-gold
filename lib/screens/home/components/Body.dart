import 'package:flutter/material.dart';
import 'package:learnUI/screens/home/components/Promos.dart';
import 'package:learnUI/screens/home/components/ShortCuts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height - 250,
      child: Column(
        children: [
          ShortCuts(),
          PromosBuild(),
        ],
      ),
    );
  }
}
