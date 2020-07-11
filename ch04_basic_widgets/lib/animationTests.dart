
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hero'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HeroDetailPage())
              );
            },
            // 화면 전환시의 애니메이션
            child: Hero(
              tag: 'image',
              child: Image.network(
                'https://cdn.pixabay.com/photo/2020/06/24/03/31/child-5334516_960_720.jpg',
                width: 100,
                height: 100,
              ),
            ),
          ),
        )
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hero Detail'),
        ),
        body: Hero(
            tag: 'image',
            child: Image.network(
              'https://cdn.pixabay.com/photo/2020/06/24/03/31/child-5334516_960_720.jpg',
            )
        )
    );
  }
}
