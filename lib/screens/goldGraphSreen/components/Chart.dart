import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/goldData.dart';

class Chart extends StatefulWidget {
  final bool isSale;

  const Chart({Key? key, required this.isSale}) : super(key: key);
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  int _active = 0;
  List<Color> gradientColors = [
    Color(upperGradient),
    Color(middleGradient),
    Color(background),
  ];
  List<String> bottomTitles = ["1D", "1W", "1M", "3M", "1Y", "5Y", "6Y"];

  Widget listTitle(String value, int index) {
    return SizedBox(
      width: 50,
      height: 30,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  _active == index ? Colors.white10 : Colors.transparent)),
          onPressed: () {
            setState(() {
              _active = index;
            });
          },
          child: Text(
            value,
            textScaleFactor: 1.0,
            style: TextStyle(color: Colors.white, fontSize: normal),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AspectRatio(
          aspectRatio: 2,
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
                widget.isSale ? salePrice() : buyPrice(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int index = 0; index < bottomTitles.length; index++)
                listTitle(bottomTitles[index], index)
            ],
          ),
        )
      ],
    );
  }

  LineChartData buyPrice() {
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
            showTitles: false,
          ),
          leftTitles: SideTitles(showTitles: false)),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 30,
      minY: 0,
      maxY: 1000000,
      lineBarsData: [
        LineChartBarData(
          spots: buyPriceData.asMap().entries.map((e) {
            return FlSpot(e.key.toDouble(), e.value);
          }).toList(),
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

  LineChartData salePrice() {
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
            showTitles: false,
          ),
          leftTitles: SideTitles(showTitles: false)),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 30,
      minY: 0,
      maxY: 1000000,
      lineBarsData: [
        LineChartBarData(
          spots: salePriceData.asMap().entries.map((e) {
            return FlSpot(e.key.toDouble(), e.value);
          }).toList(),
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
