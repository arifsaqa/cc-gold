import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

final background = HexColor._getColorFromHex("#202D3E");
final upperGradient = HexColor._getColorFromHex("#F7D976");
final upperGradient1 = HexColor._getColorFromHex("#e3c76b");
final middleGradient = HexColor._getColorFromHex("#C3A23F");
final middleGradient1 = HexColor._getColorFromHex("#b8983b");
final lowerGradient = HexColor._getColorFromHex("#B59533");
final lowerGragdient1 = HexColor._getColorFromHex("#9c802a");
final light = HexColor._getColorFromHex("#CBCBDD");
final priceLabel = HexColor._getColorFromHex("#222222");
final price = HexColor._getColorFromHex("#202D3E");
