import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:learnUI/bindings/data_trees_binding.dart';
import 'package:learnUI/bindings/user_binding.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/controllers/dataTreesController.dart';
import 'package:learnUI/controllers/deviceDataController.dart';
import 'package:learnUI/controllers/userController.dart';
import 'package:learnUI/screens/goldGraphSreen/GoldGraphScreen.dart';
import 'package:learnUI/screens/home/HomeScreen.dart';
import 'package:learnUI/screens/notifications/notificationScreen.dart';
import 'package:learnUI/screens/profile/ProfileScreen.dart';
import 'package:learnUI/screens/wallet/WalletScreen.dart';
import 'package:learnUI/screens/welcome/auth.dart';
import 'package:learnUI/screens/welcome/welcome.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  DeviceDataController controller = Get.put(DeviceDataController());

  bool _initialized = false;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData =
            await _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = await _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Future<Map<String, dynamic>> _readAndroidBuildData(
      AndroidDeviceInfo build) async {
    print(build.model);
    var pref = await SharedPreferences.getInstance();
    pref.setString("deviceId", build.model + build.isPhysicalDevice.toString());
    await controller
        .setDeviceId(build.model + build.isPhysicalDevice.toString());
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Future<Map<String, dynamic>> _readIosDeviceInfo(IosDeviceInfo data) async {
    await controller.setDeviceId(data.model + data.isPhysicalDevice.toString());
    var pref = await SharedPreferences.getInstance();
    pref.setString("deviceId", data.model + data.isPhysicalDevice.toString());
    // print(data.model);
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  @override
  Widget build(BuildContext context) {
    // print(_deviceData);
    return GetMaterialApp(
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
      getPages: [
        GetPage<dynamic>(
            name: '/',
            page: () => Welcome(),
            bindings: [UserBinding(), DataTreeBinding()]),
        GetPage<dynamic>(
            name: '/login',
            page: () => Auth(
                  title: "Masuk",
                  description: "Silahkan masukkan nomor HP-mu yang aktif",
                  onClick: "login",
                )),
        GetPage<dynamic>(
            name: '/verifikasi',
            page: () => Auth(
                  title: "Verifikasi",
                  description:
                      "Silahkan masukkan kode verifikasi yang dikirim melalui SMS",
                  onClick: "verif",
                )),
        GetPage<dynamic>(name: '/logged', page: () => LoggedIn()),
        GetPage<dynamic>(
            name: '/notifications', page: () => NotificationScreen()),
      ],
      initialRoute: '/',
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
    Get.put(UserController());
    Get.put(DataTreeController());
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
