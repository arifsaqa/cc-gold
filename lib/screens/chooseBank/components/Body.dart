import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/paymentMethods.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 40),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.05),
                spreadRadius: 10,
                blurRadius: 2,
                offset: Offset(2, 10))
          ]),
      child: SizedBox(
          height: 370,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: paymentMethods.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context, index);
                },
                child: Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              width: 1.0,
                              color: Colors.grey.withOpacity(.05),
                            ),
                            top: BorderSide(
                              width: 1.0,
                              color: Colors.grey.withOpacity(.05),
                            ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(13),
                                height: 58,
                                width: 58,
                                child: Image.asset(paymentMethods[index].image,
                                    scale: 0.8),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text(
                                      paymentMethods[index].label,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: normal,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
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
                ),
              );
            },
          )),
    );
  }
}
