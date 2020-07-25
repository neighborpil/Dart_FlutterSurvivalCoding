import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final dummyItems = [
  'https://cdn.pixabay.com/photo/2020/07/01/01/23/father-5358083_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/09/05/11/37/baby-2717347_960_720.jpg',
  'https://cdn.pixabay.com/photo/2016/05/17/22/16/baby-1399332_960_720.jpg',
];

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () {
                  print('택시 클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      color: Colors.orange,
                      size: 40,
                    ),
                    Text(
                      '택시',
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('블랙 클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text(
                      '블랙',
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.directions_bike,
                    size: 40,
                  ),
                  Text(
                    '바이크',
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    size: 40,
                  ),
                  Text(
                    '마차',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    color: Colors.orange,
                    size: 40,
                  ),
                  Text(
                    '택시',
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text(
                    '블랙',
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.directions_bike,
                    size: 40,
                  ),
                  Text(
                    '바이크',
                  ),
                ],
              ),
              Opacity(
                opacity: 0.0, // 투명
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      size: 40,
                    ),
                    Text(
                      '마차',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150, // 높이 150
        autoPlay: true,
      ),
      items: dummyItems.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
//      items: [1, 2, 3, 4, 5].map((i) {
//        // 5페이지
//        return Builder(
//          builder: (BuildContext context) {
//            return Container(
//              width: MediaQuery.of(context).size.width, // 기기의 가로 길이
//              margin: EdgeInsets.symmetric(horizontal: 5.0), // 좌우여백 5.0
//              decoration: BoxDecoration(
//                color: Colors.amber,
//              ),
//              child: Text(
//                'text $i',
//                style: TextStyle(fontSize: 16.0), // 배경색
//              ),
//            );
//          },
//        );
//      }).toList(),
    );
  }

  Widget _buildBottom() {
    final items = List.generate(10, (i) {
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('[이벤트] 이것은 공지임'),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(), // 이 리스트의 스크롤 동작 금지
      shrinkWrap: true, // 이 리스트가 다른 스크롤 객체 안에 있다면 true로 설정
      children: items,
    );
  }
}
