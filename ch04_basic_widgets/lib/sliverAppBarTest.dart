import 'package:flutter/material.dart';

class SilverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar 지정 X, body에 CustomScrollView 인스턴스 지정
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar( // 헤더영역
            pinned: true, // 축소시 상단에 appbar가 고정되는지 설정
            expandedHeight: 180.0, // 헤더의 최대 높이
            flexibleSpace: FlexibleSpaceBar( // 늘어나는 영역의 UI 정의
              title: Text("Sliver"),
              background: Image.network(
                'https://cdn.pixabay.com/photo/2014/04/05/13/05/portrait-317041_960_720.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 하나의 정적인 화면을 구성할 때 사용
          SliverFillRemaining( // 내용 영역
            child: Center(
              child: Text('center')
            ),
          )
        ],
      ),
    );
  }
}

class SliverListPage extends StatelessWidget {

  // 0-49 표시하는 listTitle을 담은 리스트
  final _items = List.generate(50, (i) => ListTile(title: Text('No. $i')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver'),
              background: Image.network(
                'https://cdn.pixabay.com/photo/2014/09/16/01/19/girl-447701_960_720.jpg',
                fit: BoxFit.cover,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.camera_enhance),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('제목'),
                        content: Text('바디'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () {
                              // 다이얼로그 닫기
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('CANCEL'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    }
                  );
                },
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(_items),
          )
        ],
      ),
    );
  }
}
