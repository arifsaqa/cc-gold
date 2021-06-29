import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Color> gradientColors = [
    Color(upperGradient),
    Color(middleGradient),
    Color(background),
  ];

  List<String> leftTitles = [
    "910.000",
    "915.000",
    "920.000",
    "925.000",
  ];

  List<String> bottomTitles = ["1D", "1W", "1M", "3M", "1Y", "5Y", "6Y"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontFamily: "MetroReg",
              fontSize: 16),
          getTitles: (value) {
            int toWatch = value.toInt();
            switch (toWatch) {
              case 1:
                return bottomTitles[0];
              case 3:
                return bottomTitles[1];
              case 5:
                return bottomTitles[2];
              case 7:
                return bottomTitles[3];
              case 9:
                return bottomTitles[4];
              case 11:
                return bottomTitles[5];
              case 13:
                return bottomTitles[6];
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "MetroReg",
            fontSize: 15,
          ),
          getTitles: (value) {
            int toWatch = value.toInt();
            switch (toWatch) {
              case 1:
                return leftTitles[0];
              case 3:
                return leftTitles[1];
              case 5:
                return leftTitles[2];
              case 7:
                return leftTitles[3];
            }
            return '';
          },
          reservedSize: 40,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 14,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 1),
            FlSpot(2, 4),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(13, 4),
            FlSpot(14, 3),
          ],
          isCurved: true,
          colors: [
            Colors.white,
          ],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(1)).toList(),
            gradientColorStops: [0.0, 0.4, 1.0],
            gradientFrom: const Offset(0, 0),
            gradientTo: const Offset(0, 1),
          ),
        ),
      ],
    );
  }
}
