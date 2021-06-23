import 'package:flutter/material.dart';
import 'package:learnUI/screens/wallet/components/Body.dart';
import 'package:learnUI/screens/wallet/components/Head.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [Head(), Body()],
      ),
    );
  }
}
