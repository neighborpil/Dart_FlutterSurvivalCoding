
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0; // 페이지 인덱스 0, 1, 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('복잡한 UI'),
      ),
      body: Center(
        child: Text(
          '$_index 페이지',
          style: TextStyle(fontSize: 40),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _index = index; // 선택된 탭의 인덱스로 _index 변경
          });
        },
        currentIndex: _index, // 선택된 인덱스
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text('홈'),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text('이용서비스'),
              icon: Icon(Icons.assignment)
          ),
          BottomNavigationBarItem(
              title: Text('내 정보'),
              icon: Icon(Icons.account_circle)
          ),
          BottomNavigationBarItem(
              title: Text('연락처'),
              icon: Icon(Icons.phone)
          ),
        ],
      ),
    );
  }
}