import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/screens/components/Promos.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Promo Hari Ini",
            style: TextStyle(color: Color(light), fontSize: sm),
          ),
        ),
        PromosBuild(),
      ],
    );
  }
}
