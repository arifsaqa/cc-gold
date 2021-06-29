import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/screens/goldGraphSreen/components/Chart.dart';

class Head extends StatefulWidget {
  @override
  _StateHead createState() => _StateHead();
}

class _StateHead extends State<Head> {
  int _selectedGraph = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2,
      width: size.width,
      decoration: BoxDecoration(
        color: Color(background),
      ),
      child: SafeArea(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedGraph = 0;
                          print(_selectedGraph);
                        });
                      },
                      child: Container(
                        width: size.width / 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 55, vertical: 20),
                        color: _selectedGraph != 0
                            ? Colors.black12
                            : Colors.white10,
                        child: Text(
                          "Harga Jual",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              fontSize: sm, fontFamily: "MetroMedium"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedGraph = 1;
                          print(_selectedGraph);
                        });
                      },
                      child: Container(
                        width: size.width / 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 55, vertical: 20),
                        color: _selectedGraph != 1
                            ? Colors.black12
                            : Colors.white10,
                        child: Text(
                          "Harga Beli",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              fontSize: sm, fontFamily: "MetroMedium"),
                        ),
                      ),
                    )
                  ],
                ),
                Chart()
              ]),
        ),
      ),
    );
  }
}
