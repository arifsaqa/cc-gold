import 'package:flutter/material.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/notifications.dart';

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  int selectedId = 0;
  String getLabel(int id) {
    String res = '';
    for (int i = 0; i < notifType.length; i++) {
      if (id == notifType[i].id) {
        res = 'images/notif/' + notifType[i].label + '.png';
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            "Hari ini",
            textScaleFactor: 1.0,
            style: TextStyle(
                color: Color.fromRGBO(32, 45, 62, 0.5),
                fontSize: sm,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.03),
                    spreadRadius: 10,
                    blurRadius: 2,
                    offset: Offset(2, 10))
              ]),
          padding: EdgeInsets.only(top: 20),
          child: SizedBox(
              // height: 310,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: todayNotif.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: 1.0,
                        color: Colors.grey.withOpacity(.05),
                      ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 14),
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(32, 45, 62, 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child:
                                  Image.asset(getLabel(todayNotif[index].type)),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: size.width * .6,
                                child: Text(
                                  todayNotif[index].title,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                width: size.width * .6,
                                child: Text(
                                  todayNotif[index].time,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 12),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
        )
      ],
    );
  }
}
