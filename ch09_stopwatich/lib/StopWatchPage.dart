import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchPage extends StatefulWidget {
  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  Timer _timer;

  var _time = 0; // 0.01초마다 1씩 증가시킬 정수형 변수
  var _isRunning = false; // 현재 시작 상태

  List<String> _lapTimers = []; // 랩타임에 표시할 시간을 저장할 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StopWatch'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        onPressed: () => setState(() {
          _clickButton();
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  /// 내용 부분
  _buildBody() {
    var sec = _time ~/ 100; // 초,  ~/ : 몫 구하기
    var hundredth = '${_time % 100}'.padLeft(2, '0');

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '$sec',
                      style: TextStyle(
                        fontSize: 50.0,
                      ),
                    ),
                    Text('$hundredth'), // 1/100초
                  ],
                ),
                Container(
                  // 랩타입 표시 영역
                  width: 100,
                  height: 200,
                  child: ListView(
                    children: _lapTimers.map((time) => Text(time)).toList(),
                  ),
                )
              ],
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: FloatingActionButton(
                // 왼쪽 아래에 위치한 초기화 버튼
                backgroundColor: Colors.deepOrange,
                onPressed: _reset,
                child: Icon(Icons.rotate_left),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: RaisedButton(
                // 오른쪽 아래에 위치한 랩타임 버튼
                onPressed: () {
                  setState(() {
                    _recordLapTime('$sec.$hundredth');
                  });
                },
                child: Text('랩타임'),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 시작 또는 일시정지 버튼 클릭
  void _clickButton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  /// 1/100초에 한번씩 time변수 1씩 증가
  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  /// 타이머 취소
  void _pause() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  /// 초기화
  void _reset() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _lapTimers.clear();
      _time = 0;
    });
  }

  /// 랩타임 기록
  void _recordLapTime(String time) {
    _lapTimers.insert(0, '${_lapTimers.length + 1}등 $time');
  }
}
