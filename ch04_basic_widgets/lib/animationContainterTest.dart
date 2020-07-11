
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  
  var _size = 100.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            final random = Random();
            setState(() {
              // 클릭할 때마다 100.0 ~ 299.0 실수 얻기
              _size = random.nextInt(200).toDouble() + 100;
            });
          },
          // 한 화면 내에서의 애니메이션
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: _size,
            height: _size,
            child: Image.network(
              'https://cdn.pixabay.com/photo/2018/01/31/09/42/people-3120717_960_720.jpg'
            ),
            curve: Curves.fastOutSlowIn,
          ),
        )
      )
    );
  }
}

