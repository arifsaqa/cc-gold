import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/recentNumbers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 90),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Transaksi Terakhir",
              style: TextStyle(
                  color: Color.fromRGBO(32, 45, 62, 0.5),
                  fontSize: sm,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
              height: 300,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: 1.0,
                        color: Colors.grey.withOpacity(.08),
                      ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Container(
                              width: size.width * .6,
                              child: Text(
                                numbers[index].number,
                                style: TextStyle(
                                    color: Colors.black, fontSize: sm),
                              ),
                            )
                          ]),
                          Icon(
                            Icons.chevron_right,
                            size: 30,
                            color: Color(light),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
