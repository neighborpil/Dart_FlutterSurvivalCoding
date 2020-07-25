import 'package:flutter/material.dart';

import 'Person.dart';

class FirstStatefulPage extends StatefulWidget {
  @override
  _FirstStatefulPageState createState() => _FirstStatefulPageState();
}

class _FirstStatefulPageState extends State<FirstStatefulPage> {
  @override
  Widget build(BuildContext context) {
    print('FirstPage build() - ');
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: RaisedButton(
        child: Text('Move to Next Page'),
        onPressed: () {
          final person = Person('Peter', 20);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondStatefulPage(person: person),
            )
          );
        },
      )
    );
  }
}


class SecondStatefulPage extends StatefulWidget {

  final Person person;

  SecondStatefulPage({Key key, @required this.person}) : super(key: key);

  @override
  _SecondStatefulPageState createState() => _SecondStatefulPageState();
}

class _SecondStatefulPageState extends State<SecondStatefulPage> {
  @override
  Widget build(BuildContext context) {
    print('Second Page build() - ');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: RaisedButton(
        child: Text('이전 페이지로'),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    );
  }

}
