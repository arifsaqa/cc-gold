import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/models/paymentMethods.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
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
          width: size.width,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: paymentMethods.length,
            itemBuilder: (context, index) {
              return Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 1.0,
                    color: Colors.grey.withOpacity(.05),
                  ))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image.asset(paymentMethods[index].image),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(38, 51, 70, .1),
                              borderRadius: BorderRadius.circular(8)),
                          height: 40,
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: size.width * .6,
                              child: Text(
                                paymentMethods[index].label,
                                style: TextStyle(
                                    color: Colors.black,
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
              );
            },
          )),
    );
  }
}
