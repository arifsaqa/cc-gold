import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _StateResgisterScreen createState() => _StateResgisterScreen();
}

class _StateResgisterScreen extends State<RegisterScreen> {
  int index = 0;
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    InputDecoration buildInputDecoration({
      required IconData icons,
      required String hinttext,
      required int myIndex,
    }) {
      return InputDecoration(
        hintText: hinttext,
        prefixIcon: Icon(
          icons,
          color: index == myIndex ? Colors.white : Color(lowerGradient),
        ),
        focusedErrorBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.white, width: 1.5),
        ),
        hintStyle:
            TextStyle(color: Color.fromRGBO(255, 255, 255, .5), fontSize: sm),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Color(lowerGradient),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Color(lowerGradient),
            width: 1.5,
          ),
        ),
      );
    }

    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
              fontFamily: "MetroReg"),
          cupertinoOverrideTheme:
              NoDefaultCupertinoThemeData(primaryColor: Colors.white),
          primaryColor: Colors.white,
          accentColor: Colors.white,
          focusColor: Colors.white,
          accentIconTheme: IconThemeData(color: Colors.white),
          primaryIconTheme: IconThemeData(color: Colors.white),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white,
          )),
      home: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
        child: Container(
            height: size.height,
            width: size.width,
            color: Color(background),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Daftar",
                      textScaleFactor: 1.0,
                      style:
                          TextStyle(fontSize: md, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Easy gold anywhere, everywhere",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontSize: sm, color: Color(lowerGradient)),
                      ),
                    )
                  ],
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextField(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        autofocus: true,
                        focusNode: _focusNodes[0],
                        decoration: buildInputDecoration(
                          hinttext: "Name",
                          myIndex: 0,
                          icons: Icons.person,
                        ),
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          fontSize: normal,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        focusNode: _focusNodes[1],
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        decoration: buildInputDecoration(
                            myIndex: 1, hinttext: "Email", icons: Icons.email),
                        keyboardType: TextInputType.emailAddress,
                        // onChanged: widget.onChange,
                        style: TextStyle(
                          fontSize: normal,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        focusNode: _focusNodes[2],
                        decoration: buildInputDecoration(
                          hinttext: "No Hp",
                          myIndex: 2,
                          icons: Icons.phone,
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: normal,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        onTap: () {
                          setState(() {
                            index = 3;
                          });
                        },
                        focusNode: _focusNodes[3],
                        decoration: buildInputDecoration(
                            icons: Icons.lock, hinttext: "PIN", myIndex: 3),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        style: TextStyle(
                          fontSize: normal,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 40),
                      FloatingActionButton(
                        onPressed: null,
                        child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(upperGradient1),
                                      Color(middleGradient1),
                                      Color(lowerGragdient1),
                                    ])),
                            child: Icon(Icons.arrow_forward)),
                        foregroundColor: Color(background),
                      )
                    ],
                  ),
                )
              ],
            )),
      )),
    );
  }
}
