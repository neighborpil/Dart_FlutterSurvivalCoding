import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'My home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: isChecked,
            onChanged: (value) => {
              setState(() => {
                isChecked = value,
                print('isChecked: $isChecked')
              })
            },
          ),
          SizedBox(
            height: 100,
          ),
          Switch(
            value: isChecked,
              onChanged: (value) => {
                setState(() {
                  isChecked = value;
                })
              },
          )
        ],
      )
    );
  }
}

//
//class MyHomePage extends StatelessWidget {
//  var isChecked = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//          TextField(),
//          TextField(
//            decoration: InputDecoration(
//              labelText: '여기에 입력하세요' // 힌트
//            ),
//          ),
//          TextField(
//            decoration: InputDecoration(
//              border: OutlineInputBorder(),
//              labelText: '여기 입력해'
//            ),
//          ),
//          Checkbox(
//            value: isChecked,
//            onChanged: (value)  => {
//              setState(() {
//                isChecked = value;
//              })
//            }
//          )
//        ],
//      )
//    );
//  }
//}
