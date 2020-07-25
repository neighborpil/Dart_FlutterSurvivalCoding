import 'package:flutter/material.dart';

import 'Person.dart';

class FirstStatefulPage4 extends StatefulWidget {
  @override
  _FirstStatefulPage4State createState() => _FirstStatefulPage4State();
}

class _FirstStatefulPage4State extends State<FirstStatefulPage4> {


  @override
  void initState() {
    super.initState();
    print('Fisrt Stateful Page initState');
  }

  @override
  Widget build(BuildContext context) {
    print('Fisrt Stateful Page Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Fisrt Page'),
      ),
      body: RaisedButton(
        child: Text('다음 페이지'),
        onPressed: () {
          final person = Person('홍길동', 20);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondStatefulPage4(person: person)
            )
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('Fisrt Stateful Page dispose');
  }
}

class SecondStatefulPage4 extends StatefulWidget {

  final Person person;

  SecondStatefulPage4({Key key, @required this.person}) : super(key: key);

  @override
  _SecondStatefulPage4State createState() => _SecondStatefulPage4State();
}

class _SecondStatefulPage4State extends State<SecondStatefulPage4> {


  @override
  void initState() {
    super.initState();
    print('Second Stateful Page initState');
  }

  @override
  Widget build(BuildContext context) {
    print('Second Stateful Page Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: RaisedButton(
        child: Text('go back'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('Second Stateful Page dispose');
  }
}
