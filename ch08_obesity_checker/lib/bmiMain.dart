import 'package:flutter/material.dart';

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // 외곽선 있고 힌트메시지 있음
                  hintText: '키',
                ),
                keyboardType: TextInputType.number, // 숫자만 입력 가능
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  child: Text('결과'),
                  onPressed: () {
                    // 폼에 입력된 값 검증
                    if(_formKey.currentState.validate()) {
                      // 검증시 처리
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
