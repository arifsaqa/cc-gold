import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';

class MyCustomForm1 extends StatefulWidget {
  final Function(String) onChange;
  MyCustomForm1({required this.onChange});

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm1> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
      keyboardType: TextInputType.number,
      onChanged: widget.onChange,
      style: TextStyle(
        fontSize: input,
        color: Color(upperGradient),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
