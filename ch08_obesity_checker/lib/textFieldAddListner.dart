
import 'package:flutter/material.dart';

class MyAddListenerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obesity Checker',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  final myController = TextEditingController();


  @override
  void initState() {
    super.initState();

    // addListener로 상태를 모니터링 할 수 있음
    myController.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    // 컨트롤러의 text 프로퍼티로 연결된 TextField에 입력된 값을 얻음
    print('두번째 텍스트 필드: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Input 연습'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) { // 텍스트 변경 감지 이벤트
                print('첫번째 text field: $text');
              },
            ),
            TextField(
              controller: myController, // 컨트롤러 지정
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 화면이 종료 될 때 반드시 위젯 트리에서 컨트롤러를 해재해야함
    myController.dispose();
    super.dispose();
  }
}
