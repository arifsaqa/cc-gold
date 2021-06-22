import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/screens/home/HomeScreen.dart';
import 'package:learnUI/screens/profile/ProfileScreen.dart';
import 'package:learnUI/screens/wallet/WalletScreen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
              fontFamily: "MetroReg"),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      title: _title,
      home: MyStatefulWidget(
        key: null,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _bottomNavIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    Settings(),
    WalletScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index != 4) {
      setState(() {
        _bottomNavIndex = index;
      });

      print(_bottomNavIndex);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (context) => Settings()),
      );
    }
  }

  Widget pageCaller(int index) {
    return pages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageCaller(_bottomNavIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: _bottomNavIndex == 0
                  ? Image.asset(
                      "images/navs/homeActive.png",
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      "images/navs/homeUnactive.png",
                      width: 25,
                      height: 25,
                    ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _bottomNavIndex == 1
                  ? Image.asset(
                      "images/navs/barActive.png",
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      "images/navs/barUnactive.png",
                      width: 25,
                      height: 25,
                    ),
              label: 'Gold Price',
            ),
            BottomNavigationBarItem(
              icon: _bottomNavIndex == 2
                  ? Image.asset(
                      "images/navs/cardActive.png",
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      "images/navs/cardUnactive.png",
                      width: 25,
                      height: 25,
                    ),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: _bottomNavIndex == 3
                  ? Image.asset(
                      "images/navs/personActive.png",
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      "images/navs/personUnactive.png",
                      width: 25,
                      height: 25,
                    ),
              label: 'Profile',
            ),
          ],
          unselectedItemColor: Color(light),
          currentIndex: _bottomNavIndex,
          selectedItemColor: Color(background),
          showSelectedLabels: false,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
