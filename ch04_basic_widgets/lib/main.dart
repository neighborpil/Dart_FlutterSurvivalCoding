import 'package:ch04basicwidgets/sliverAppBarTest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animationContainterTest.dart';
import 'animationTests.dart';

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
      home: SliverListPage(),
//      home: SilverPage(),
//      home: AnimatedContainerPage(),
//      home: HeroPage(),
//      home: MyHomePage(title: 'My home'),
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
  var _gender = Gender.MAN;
  var _fruit = Fruit.APPLE;
  final _valueList = ['첫째', '둘째', '셋째'];
  var _selectedValue = '첫째';

  DateTime _selectedTime;
  String _selectedTimeOfDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: isChecked,
                onChanged: (value) => {
                  setState(
                      () => {isChecked = value, print('isChecked: $isChecked')})
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
              ),
              // 라디오 버튼(버튼 영역만 터치 영역)
              ListTile(
                title: Text('남자'),
                leading: Radio(
                  value: Gender.MAN,
                  groupValue: _gender,
                  onChanged: (value) => {
                    setState(() => {_gender = value})
                  },
                ),
              ),
              ListTile(
                title: Text('여자'),
                leading: Radio(
                    value: Gender.WOMAN,
                    groupValue: _gender,
                    onChanged: (value) => {
                          setState(() => {_gender = value})
                        }),
              ),
              SizedBox(
                height: 40,
              ),
              // 라디오 버튼(가로영역 전체가 터치영역)
              RadioListTile(
                title: Text('사과'),
                value: Fruit.APPLE,
                groupValue: _fruit,
                onChanged: (v) => {
                  setState(() => {_fruit = v})
                },
              ),
              RadioListTile(
                title: Text('바나나'),
                value: Fruit.BANANA,
                groupValue: _fruit,
                onChanged: (v) => {
                  setState(() => {_fruit = v})
                },
              ),
              RadioListTile(
                title: Text('포도'),
                value: Fruit.GRAPE,
                groupValue: _fruit,
                onChanged: (v) => {
                  setState(() => {_fruit = v})
                },
              ),
              SizedBox(
                height: 40,
              ),
              // 드랍다운버튼
              DropdownButton(
                value: _selectedValue,
                items: _valueList
                    .map((v) => DropdownMenuItem(
                          value: v,
                          child: Text(v),
                        ))
                    .toList(),
                onChanged: (v) => _selectedValue = v,
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: RaisedButton(
                  child: Text('Show AlertDialog'),
                  onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: false, // 화면 바깥을 눌러도 다이얼로그창 닫히지 않음
                    builder: (context) => AlertDialog(
                      title: Text('제목'),
                      content: SingleChildScrollView(
                          child: ListBody(
                        children: <Widget>[
                          Text('Alert Dialog'),
                          Text('OK 눌러 닫음')
                        ],
                      )),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        FlatButton(
                          child: Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                  child: FlatButton(
                child: Text('DatePicker'),
                onPressed: () {
                  Future<DateTime> selectedDate = showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2030),
                      builder: (context, child) => Theme(
                            data: ThemeData.dark(),
                            child: child,
                          ));

                  // 사용자가 날짜를 선택할때까지 블록
                  selectedDate.then((dateTime) {
                    setState(() {
                      _selectedTime = dateTime;
                    });
                  });
                },
              )),
              Text('$_selectedTime'),
              SizedBox(
                height: 40,
              ),
              Center(
                child: FlatButton(
                  child: Text('TimePicker'),
                  onPressed: (){
                    Future<TimeOfDay> selectedTime = showTimePicker(context: context, initialTime: TimeOfDay.now());

                    // 사용자가 시간을 선택할 때까지 블록
                    selectedTime.then((timeOfDay){
                      setState(() {
                        _selectedTimeOfDay = '${timeOfDay.hour}:${timeOfDay.minute}';
                      });
                    });
                  },
                ),
              ),
              Text('$_selectedTimeOfDay'),
              SizedBox(
                height: 40,
              ),
              // 이벤트 프로퍼티가 없는 위젯에 이벤트를 주기 위하여 사용, 감싸서 사용
              GestureDetector(
                onTap: (){
                  print('GestureDetector 클릭!');
                },
                child: Text('클릭 미!'),
              ),
              SizedBox(
                height: 40,
              ),
              // 이벤트 프로퍼티가 없는 위젯에 이벤트를 주기 위하여 사용, 감싸서 사용
              // GestureDetector와 동일하지만 클릭시 물결이벤트 있음
              InkWell(
                onTap: (){
                  print('InkWell 클릭!');
                },
                child: Text('클릭 미!!'),
              ),
            ],
          ),
        ));
  }
}

enum Gender { MAN, WOMAN }

enum Fruit { BANANA, APPLE, GRAPE }

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
