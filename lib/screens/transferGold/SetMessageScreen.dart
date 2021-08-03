import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:learnUI/screens/transferGold/Confirmation.dart';
// import 'package:learnUI/screens/transferGold/Confirmation.dart';

class SetMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionController = Get.find<TransactionController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Title(
            color: Color(background),
            child: Text(
              "Pesan",
              textScaleFactor: 1.0,
              style: TextStyle(fontFamily: "MetroBold"),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyCustomForm(
              onChange: (context) => (() {
                print(context);
              }),
              onSubmit: (context) => (() {
                transactionController.message.value = context;
              }),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  final Function(String) onChange;
  final Function(String)? onSubmit;
  MyCustomForm({required this.onChange, this.onSubmit});

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(myController.text);
    final transactionController = Get.find<TransactionController>();
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - 120,
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(top: 30),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Tambahkan Pesan",
              textScaleFactor: 1.0,
              style: TextStyle(
                  color: Color.fromRGBO(32, 45, 62, 0.5),
                  fontSize: sm,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black12,
              width: 1,
            ))),
            child: TextField(
              maxLines: null,
              controller: myController,
              // onSubmitted: (context),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
              onChanged: widget.onChange,
              style: TextStyle(
                fontSize: normal,
                color: Colors.black,
              ),
            ),
          ),
        ]),
        Container(
          height: 60,
          child: Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: () async {
                transactionController.message.value = myController.text;
                Get.to<void>(Confirmation());
              },
              child: Text(
                "Konfirmasi",
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: sm,
                    fontWeight: FontWeight.w600),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
                backgroundColor: MaterialStateProperty.all(Color(background)),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
