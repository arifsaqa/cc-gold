import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';

class MyBackButton extends StatelessWidget {
  final String title;

  const MyBackButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 120,
      width: size.width,
      padding: EdgeInsets.only(right: 24, left: 24),
      decoration: BoxDecoration(
        color: Color(background),
      ),
      child: SafeArea(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                            title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: header,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
