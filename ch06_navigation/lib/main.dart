import 'package:ch06navigation/c6p1_4_moveToNewPageWithParmeters.dart';
import 'package:ch06navigation/ch6_p3_2_MovementOfStatefullWidgetClass.dart';
import 'package:flutter/material.dart';

import 'c6p1_moveToNewPage.dart';
import 'c6p2_navigationUsingRoute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstStatefulPage(),
//      routes: {
//        '/first': (context) => FirstStatefulPage(),
//        '/second': (context) => SecondStatefulPage()
//      },
//      home: FirstPage3(),
//      routes: {
//        '/first': (context) => FirstPage3(),
//        '/second': (context) => SecondPage3()
//      },

//      home: FirstPage2(), // 첫 페이지를 시작 페이지로 설정
      // home: FirstPage(), // 첫 페이지를 시작 페이지로 설정
    );
  }
}
