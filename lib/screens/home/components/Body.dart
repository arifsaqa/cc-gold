import 'package:flutter/material.dart';
import 'package:learnUI/screens/home/components/Promos.dart';
import 'package:learnUI/screens/home/components/ShortCuts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ShortCuts(),
          PromosBuild(),
        ],
      ),
    );
  }
}
