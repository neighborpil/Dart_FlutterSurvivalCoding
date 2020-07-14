import 'package:flutter/material.dart';

import 'Person.dart';

class FirstPage2 extends StatelessWidget {
  String message = 'before';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('Move to Second'),
                onPressed: () async {
                  final person = Person('홍길동', 20);

                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage2(person: person)));
                })
          ],
        ));
  }
}

class SecondPage2 extends StatelessWidget {
  final Person person;

  SecondPage2({@required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Move to First'),
            onPressed: () {
              Navigator.pop(context, 'ok');
            },
          ),
          Text('${person.name} : ${person.age}')
        ],
      ),
    );
  }
}
