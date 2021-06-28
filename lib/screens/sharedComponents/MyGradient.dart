import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';

class GradientText extends StatelessWidget {
  GradientText({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(upperGradient),
            Color(lowerGradient),
          ]).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
