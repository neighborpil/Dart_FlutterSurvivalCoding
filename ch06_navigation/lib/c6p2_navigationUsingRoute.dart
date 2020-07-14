import 'package:flutter/material.dart';

class FirstPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('First Page Build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page3'),
      ),
      body: RaisedButton(
        child: Text('Move to second page'),
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/second');

          print(result);
        },
      ),
    );
  }
}

class SecondPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Second Page Build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page3'),
      ),
      body: RaisedButton(
        child: Text('Move to First Page'),
        onPressed: () {
          Navigator.pop(context, 'ok');
        },
      ),
    );
  }
}
