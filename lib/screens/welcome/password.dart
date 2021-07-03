import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';

class Password extends StatefulWidget {
  final Widget redirecto;
  final bool isLoggingin;

  const Password({Key? key, required this.redirecto, required this.isLoggingin})
      : super(key: key);
  _StatePassword createState() => _StatePassword();
}

class _StatePassword extends State<Password> {
  String _typedPassword = '';
  void onTap() {
    setState(() {
      if (_typedPassword.length > 0) {
        String finalStr =
            _typedPassword.substring(0, _typedPassword.length - 1) +
                _typedPassword.substring(_typedPassword.length - 1 + 1);
        _typedPassword = finalStr;
      }
    });
  }

  void onPress() {
    setState(() {
      if (_typedPassword.length > 0) {
        _typedPassword = '';
      }
    });
  }

  void inputController(String input) {
    setState(() {
      if (_typedPassword.length <= 6) {
        _typedPassword += input;
      }
    });
  }

  void cekPassword() async {
    int cek = await _typedPassword.length;
    if (cek == 6) {
      Navigator.push<void>(
          context, MaterialPageRoute(builder: (context) => widget.redirecto));
    } else {
      print(_typedPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    cekPassword();
    return SafeArea(
      child: Scaffold(
          // appBar: PreferredSize(
          //   preferredSize: whereTo
          //       ? Size.fromHeight(150.0)
          //       : Size.fromHeight(0), // here the des
          //   child: AppBar(
          //     automaticallyImplyLeading: whereTo,
          //     // toolbarHeight: whereTo ? 150 : 0,
          //   ),
          // ),
          body: SingleChildScrollView(
              child: Container(
        height: size.height,
        color: Color(background),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Text(
                            "Password",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontFamily: "MetroBold",
                              fontSize: md,
                            ),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Masukkan password akun anda",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: sm,
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 39),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Circle(
                    isFill: _typedPassword.length >= 1,
                  ),
                  Circle(
                    isFill: _typedPassword.length >= 2,
                  ),
                  Circle(
                    isFill: _typedPassword.length >= 3,
                  ),
                  Circle(
                    isFill: _typedPassword.length >= 4,
                  ),
                  Circle(
                    isFill: _typedPassword.length >= 5,
                  ),
                  Circle(
                    isFill: _typedPassword.length >= 6,
                  )
                ],
              ),
            ),
            TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.symmetric(horizontal: 10)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (state) => Colors.white10),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (state) => Colors.white)),
                onPressed: null,
                child: Text(
                  'Lupa Password?',
                  style: TextStyle(fontSize: sm),
                  textScaleFactor: 1.0,
                )),
            // SizedBox(
            //   height: 20,
            // ),
            buttons(['1', '2', '3', '4', '5', '6', '7', '8', '9', '', '0', '0'],
                context, onTap, onPress, inputController),
            SizedBox(height: 20),
            Container(
              child: widget.isLoggingin
                  ? TextButton(
                      onPressed: null,
                      child: Text("Ganti Akun Lain",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Colors.white,
                          )))
                  : SizedBox(height: 0),
            ),
            // TextButton(
            //     onPressed: null,
            //     child: Text("Ganti Akun Lain",
            //         textScaleFactor: 1.0,
            //         style: TextStyle(
            //           color: Colors.white,
            //         ))),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ))),
    );
  }
}

class Circle extends StatelessWidget {
  final bool isFill;

  const Circle({Key? key, required this.isFill}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      width: 22.0,
      height: 22.0,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isFill
                  ? [
                      Color(upperGradient1),
                      Color(middleGradient1),
                      Color(lowerGragdient1),
                    ]
                  : [
                      Color(background),
                      Color(background),
                      Color(background),
                    ]),
          shape: BoxShape.circle,
          border: isFill
              ? Border.all(color: Color(background))
              : Border.all(color: Colors.white)),
    );
  }
}

SizedBox buttons(List<String> child, BuildContext context, Function onTap,
    Function onPress, Function inputController) {
  return SizedBox(
    height: 220,
    child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: (150 / 73),
        ),
        itemCount: child.length,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
                child: index < child.length - 1
                    ? TextButton(
                        onPressed: () {
                          inputController(child[index]);
                        },
                        child: Text(
                          child[index],
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.white, fontSize: name),
                        ))
                    : GestureDetector(
                        onTap: () {
                          onTap();
                        },
                        onLongPress: () {
                          onPress();
                        },
                        child: Icon(
                          Icons.backspace_outlined,
                          size: name,
                          color: Colors.white,
                        ),
                      )),
          );
        }),
  );
}
