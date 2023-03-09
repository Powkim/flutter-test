import 'package:flutter/material.dart';
import 'package:toonflix/screens/boardView.dart';
import 'package:toonflix/screens/board_create.dart';

class BoardList extends StatefulWidget {
  // String? title;
  // String? content;
  BoardList({super.key});

  @override
  State<BoardList> createState() => _BoardListState();
}

class _BoardListState extends State<BoardList> {
  void addData(title, content) {
    setState(() {
      arr.add({'title': title, 'content': content});
    });
  }

  List<Map<String, String>> arr = [
    {'id': '1', 'title': '제목', 'content': '내용'},
    {'id': '2', 'title': '제목2', 'content': '내용2'},
    {'id': '3', 'title': '제목', 'content': '내용'},
    {'id': '4', 'title': '제목', 'content': '내용'},
    {'id': '5', 'title': '제목', 'content': '내용'},
    {'id': '6', 'title': '제목', 'content': '내용'},
    {'id': '', 'title': '제목2', 'content': '내용2'},
    {'id': '2', 'title': '제목', 'content': '내용'},
    {'id': '2', 'title': '제목', 'content': '내용'},
    {'id': '2', 'title': '제목', 'content': '내용'},
    {'id': '2', 'title': '제목', 'content': '내용'},
    {'id': '2', 'title': '제목2', 'content': '내용2'},
    {'id': '2', 'title': '제목', 'content': '내용'},
    {'id': '2', 'title': '제목', 'content': '내용'},
    {'id': '2', 'title': '제목', 'content': '내용'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BoardCreate(test: addData)));
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: arr.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 120,
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(arr[index]['title'] ?? '',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BoardView(
                                    arr[index]['title'] ?? '',
                                    arr[index]['content'] ?? '')));
                      },
                      subtitle: Text(arr[index]['content'] ?? '',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            arr.removeWhere(
                                (element) => element["id"] == arr[index]["id"]);
                          });
                        },
                        icon: Icon(Icons.delete_outline))
                  ],
                ),
              );
            },
          ),
        ));
  }
}
