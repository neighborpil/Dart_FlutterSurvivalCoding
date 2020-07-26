import 'package:flutter/material.dart';

import 'bmiMain.dart';
import 'inputValueVarification.dart';
import 'textFieldAddListner.dart';

void main() {
  runApp(MyApp());
//  runApp(MyVerificationApp());
//  runApp(MyAddListenerApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obesity Checker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BmiMain(),
    );
  }
}

