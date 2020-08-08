import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Todo.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
//  // 할일 목록을 저장할 리스트
//  final _items = <Todo>[];

  var _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('남은 할 일'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded( // 추가 버튼 이외의 영역을 꽉 채움
                child: TextField(
                  controller: _todoController,
                ),
              ),
              RaisedButton(
                child: Text('추가'),
                onPressed: () {
                  _addTodo(Todo(_todoController.text));
                },
              )
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('todo').snapshots(),
            builder: (context, snapshot) {

              if(!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              final documents = snapshot.data.documents;

              return Expanded(
                child: ListView(
                  children: documents.map((doc) => _buildItemWidget(doc)).toList(),
                ),
              );
            }
          )
        ],
      ),
    );
  }

  /// 할 일 객체를 ListTitle 형태로 변경하느 메서드
  Widget _buildItemWidget(DocumentSnapshot doc){

    final todo = Todo(doc['title'], isDone: doc['isDone']);

    return ListTile(
      onTap: () {
        _toggleTodo(doc); // 완료/미완료 토글
      },
      title: Text(
        todo.title, // 할일
        style: todo.isDone ? TextStyle(
          decoration: TextDecoration.lineThrough, // 취소선
          fontStyle: FontStyle.italic, // 이텔렉
        ) : null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () {
          _deleteTodo(doc); // 삭제
        },
      ),
    );
  }

  /// 할 일 추가
  void _addTodo(Todo todo){

    Firestore.instance.collection('todo')
    .add({'title': todo.title, 'isDone': todo.isDone});

    _todoController.text = '';
//    setState(() {
//      _items.add(todo);
//      _todoController.text = ''; // 할일 입력 필드를 비움
//    });
  }

  /// 할 일 삭제
  void _deleteTodo(DocumentSnapshot doc){

    Firestore.instance
        .collection('todo')
        .document(doc.documentID).delete();

//    setState(() {
//      _items.remove(todo);
//    });
  }

  void _toggleTodo(DocumentSnapshot doc){

    Firestore.instance.collection('todo')
        .document(doc.documentID)
        .updateData({'isDone': !doc['isDone']});

//    setState(() {
//      todo.isDone = !todo.isDone;
//    });
  }

  @override
  void dispose() {
    _todoController?.dispose();
    super.dispose();
  }
}
