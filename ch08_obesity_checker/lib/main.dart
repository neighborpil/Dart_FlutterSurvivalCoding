import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
    print('두번째 텍스트 필드: ${myController.text}')
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
