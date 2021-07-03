import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/screens/goldGraphSreen/GoldGraphScreen.dart';
import 'package:learnUI/screens/home/HomeScreen.dart';
import 'package:learnUI/screens/notifications/notificationScreen.dart';
import 'package:learnUI/screens/profile/ProfileScreen.dart';
import 'package:learnUI/screens/wallet/WalletScreen.dart';
import 'package:learnUI/screens/welcome/auth.dart';
import 'package:learnUI/screens/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

/// This Widget is the main application widget.
class _AppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      print('error');
      return MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            builder: (context, child) => Scaffold(
              body: Container(
                color: Color(background),
                child: Center(
                  child: Text(
                    "Error",
                    style: TextStyle(
                        fontSize: header,
                        color: Colors.white,
                        fontFamily: "MetroReg"),
                  ),
                ),
              ),
            ),
          ));
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            builder: (context, child) => Scaffold(
              body: Container(
                color: Color(background),
                child: Center(
                  child: Text(
                    "Loading",
                    style: TextStyle(
                        fontSize: header,
                        color: Colors.white,
                        fontFamily: "MetroReg"),
                  ),
                ),
              ),
            ),
          ));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Color(background)),
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
      // title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/login': (context) => Auth(
              title: "Masuk",
              description: "Silahkan masukkan nomor HP-mu yang aktif",
              onClick: "login",
            ),
        '/verifikasi': (context) => Auth(
              title: "Verifikasi",
              description:
                  "Silahkan masukkan kode verifikasi yang dikirim melalui SMS",
              onClick: "verif",
            ),
        // '/password': (context) => Password(),
        '/logged': (context) => LoggedIn(),
        'notifications': (context) => NotificationScreen(),
      },
    );
  }
}

class LoggedIn extends StatefulWidget {
  LoggedIn({Key? key}) : super(key: key);

  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  int _bottomNavIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    GoldGraphScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index != 4) {
      setState(() {
        _bottomNavIndex = index;
      });

      print(_bottomNavIndex);
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
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1),
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
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color(light),
          showUnselectedLabels: false,
          currentIndex: _bottomNavIndex,
          selectedItemColor: Color(background),
          showSelectedLabels: false,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
