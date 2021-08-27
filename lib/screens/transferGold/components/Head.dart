import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:learnUI/screens/transferGold/NominalScreen.dart';
// import 'package:learnUI/screens/transferGold/components/CustomForm.dart';

class Head extends StatefulWidget {
  @override
  _StateHead createState() => _StateHead();
}

class _StateHead extends State<Head> {
  final transactionController = Get.find<TransactionController>();
  final dataTeeController = Get.find<DataTreeController>();
  var input = '';
  // _currentInput ="";
  void checkPhoneNumber(String context) {
    // dataTeeController.phoneNumbers.value.map((e) => null);
    if (dataTeeController.phoneNumbers.contains(context)) {
      transactionController.destinationNumber.value = context;
      Get.to<void>(NominalScreen());
    } else {
      Get.snackbar("Nomor Hp", "Nomor hp tidak terdaftar sebagai user!",
          colorText: Colors.red[400], duration: Duration(seconds: 3));
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      dataTeeController.getUserNumbers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionController = Get.find<TransactionController>();
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: size.width,
      padding: EdgeInsets.only(
        top: size.height * .01,
        right: 24,
        left: 24,
      ),
      decoration: BoxDecoration(
        color: Color(background),
      ),
      child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
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
                            textScaleFactor: 1.0,
                            style: TextStyle(color: Colors.black, fontSize: sm),
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
                                            input = context;
                                          }),
                                          onSubmit: (context) => () {
                                            checkPhoneNumber(context);
                                          },
                                        )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    transactionController
                                        .destinationNumber.value = input;
                                    Get.off(NominalScreen());
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                                  color: Color.fromRGBO(
                                                      151, 151, 151, 1)))),
                                      // padding: EdgeInsets.all(15),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Icon(
                                          Icons.send,
                                          size: 30,
                                        ),
                                      )),
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
    );
  }
}

class MyCustomForm extends StatefulWidget {
  final Function(String) onChange;
  final Function(String)? onSubmit;
  MyCustomForm({required this.onChange, this.onSubmit});
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  final transactionController = Get.find<TransactionController>();
  dynamic clearTextInput() {
    myController.clear();
  }

  @override
  void initState() {
    super.initState();
    if (transactionController.selectedNumber.value == '') {
      myController.text = transactionController.selectedNumber.value;
    }
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
      onSubmitted: widget.onSubmit,
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
