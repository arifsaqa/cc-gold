import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/screens/transferGold/NominalScreen.dart';
// import 'package:learnUI/screens/transferGold/components/CustomForm.dart';

class Head extends StatefulWidget {
  @override
  _StateHead createState() => _StateHead();
}

class _StateHead extends State<Head> {
  // _currentInput ="";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 260,
      width: size.width,
      padding: EdgeInsets.only(
        top: size.height * .01,
        right: 24,
        left: 24,
      ),
      decoration: BoxDecoration(
        color: Color(background),
      ),
      child: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Row(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                            size: 30,
                          ),
                          Container(
                              child: Text(
                            "Transfer Emas",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: header,
                                fontWeight: FontWeight.w600),
                          ))
                        ],
                      ),
                    ),
                  ]),
                  Positioned(
                      bottom: -115,
                      width: size.width,
                      child: SizedBox(
                        height: 120,
                      )),
                  Positioned(
                    bottom: -53,
                    child: Container(
                      padding: EdgeInsets.all(24),
                      height: 150,
                      width: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.08),
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Stack(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Nomor HP",
                              style:
                                  TextStyle(color: Colors.black, fontSize: sm),
                            ),
                            Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(151, 151, 151, 1)),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Center(
                                      child: SizedBox(
                                          height: 40,
                                          width: 231,
                                          child: MyCustomForm(
                                            onChange: (context) => setState(() {
                                              // _currentInput = context;
                                              print(context);
                                            }),
                                          )),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute<void>(
                                              builder: (context) =>
                                                  NominalScreen()));
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                left: BorderSide(
                                                    color: Color.fromRGBO(
                                                        151, 151, 151, 1)))),
                                        padding: EdgeInsets.all(15),
                                        child:
                                            Image.asset("images/contact.png")),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                ])),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  final Function(String) onChange;
  MyCustomForm({required this.onChange});
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  dynamic clearTextInput() {
    myController.clear();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        suffixIcon: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: RawMaterialButton(
            onPressed: () {
              myController.clear();
            },
            elevation: 0.0,
            padding: EdgeInsets.all(0),
            fillColor: Color.fromRGBO(151, 151, 151, .5),
            child: Icon(
              Icons.close,
              size: 13.0,
              color: Colors.white,
            ),
            constraints: BoxConstraints.tight(Size(20, 20)),
            shape: CircleBorder(),
          ),
        ),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.number,
      style: TextStyle(
          color: Colors.black, fontSize: normal, fontWeight: FontWeight.w600),
    );
  }
}
