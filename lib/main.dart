import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Retrieve Text Input',
      theme: ThemeData(
          textTheme:
              Theme.of(context).textTheme.apply(bodyColor: Color(background)),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: '/',
      routes: {'/': (context) => HomeScreen()},
    );
  }
}
