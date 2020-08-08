import 'package:ch08obesitychecker/bmiResult.dart';
import 'package:flutter/material.dart';

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

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
                controller: _heightController,
                validator: (value) {
                  if(value.trim().isEmpty) { // 입력한 값의 앞뒤를 제거한 것이 비어있다면
                    return '키를 입력하세요';
                  }
                  return null;
                },
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
                controller: _weightController,
                validator: (value) {
                  if(value.trim().isEmpty) {
                    return '체중을 입력하세요';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  child: Text('결과'),
                  onPressed: () {
                    // 폼에 입력된 값 검증
                    if(_formKey.currentState.validate()) {
                      // 키와 몸무게 값이 검증되었으면
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BmiResult(
                            double.parse(_heightController.text.trim()),
                            double.parse(_weightController.text.trim()),
                          ),
                        ),
                      );
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

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
