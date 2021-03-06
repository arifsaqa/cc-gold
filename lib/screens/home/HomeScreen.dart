import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
import 'package:learnUI/screens/home/components/Body.dart';
import 'package:learnUI/screens/home/components/Head.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: () {
                // Get.toNamed<dynamic>('/notifications');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerRight,
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 30,
                      ),
                      Positioned(
                        top: 16,
                        right: 3,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.yellow),
                          child: SizedBox(),
                        ),
                      )
                    ]),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Head(),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}
