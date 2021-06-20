import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/models/promos.dart';

class PromosBuild extends StatefulWidget {
  @override
  _PromoBuildState createState() => _PromoBuildState();
}

class _PromoBuildState extends State<PromosBuild> {
  int selectedId = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: promos.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(0),
                      width: 327,
                      decoration: BoxDecoration(
                          color: Color(background),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                promos[index].description == null
                                    ? Center(
                                        heightFactor: 1.5,
                                        child: Text(
                                          promos[index].title,
                                          style: TextStyle(
                                              color: Color(upperGradient),
                                              fontSize: normal),
                                        ),
                                      )
                                    : Text(
                                        promos[index].title,
                                        style: TextStyle(
                                            color: Color(upperGradient),
                                            fontSize: normal),
                                      ),
                                if (promos[index].description != null)
                                  SizedBox(height: 4),
                                promos[index].description != null
                                    ? Text(promos[index].description,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: xm))
                                    : Text(
                                        "",
                                        style: TextStyle(fontSize: 0),
                                      )
                              ],
                            ),
                          )),
                          FittedBox(
                              child: Image.asset(promos[index].image),
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                              clipBehavior: Clip.none)
                        ],
                      ),
                    )
                  ],
                );
              },
            )),
      ),
    );
  }
}
