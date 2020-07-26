import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyVerificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '폼 검증 데모',
      home: Scaffold(
        appBar: AppBar(
          title: Text('폼 검증 데모'),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}


class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  // Form 위젯에 유니크한 키값을 부여하고 검증시 사용
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if(value.isEmpty) {
                return '글자를 입력하세요';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              child: Text('검증'),
              onPressed: () {
                // 폼을 검증하여 통과하면 true, 실패하면 false 리턴
                if(_formKey.currentState.validate()) {
                  // 검증이 통과하면 스낵바 표시
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('검증 완료'),)); // 팝업창 띄우기
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
