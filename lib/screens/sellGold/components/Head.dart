import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/screens/SharedComponents/MyGradient.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 230,
      width: size.width,
      padding: EdgeInsets.only(right: 24, left: 24),
      decoration: BoxDecoration(
        color: Color(background),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 30,
                ),
                Container(
                    child: Text(
                  "Jual Emas",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: header,
                      fontWeight: FontWeight.w600),
                ))
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Harga beli Emas"),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GradientText(
                            child: Text(
                          "Rp. 893.252",
                          style: TextStyle(
                            fontSize: input,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                        Text("/gram")
                      ],
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Kamis",
                  style: TextStyle(color: Colors.white, fontSize: sm),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Text(
                    "10 Juni 2021",
                    style: TextStyle(color: Colors.white, fontSize: sm),
                  ),
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}

class Saldo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Saldo Emas Kamu"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "2,000 gram",
                style: TextStyle(
                    fontSize: input,
                    color: Color(upperGradient),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(children: [
              Text(
                "Senilai Rp. ",
                style: TextStyle(fontSize: normal),
              ),
              Text(
                "1.080.000",
                style: TextStyle(fontSize: normal),
              )
            ])
          ],
        ),
        Icon(
          Icons.visibility,
          color: Colors.white,
        )
      ],
    );
  }
}
