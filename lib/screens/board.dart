import 'package:flutter/material.dart';
import 'package:toonflix/screens/boardView.dart';

class BoardList extends StatefulWidget {
  const BoardList({super.key});

  @override
  State<BoardList> createState() => _BoardListState();
}

class _BoardListState extends State<BoardList> {
  List<Map<String, String>> arr = [
    {'title': '제목', 'content': '내용'},
    {'title': '제목2', 'content': '내용2'},
    {'title': '제목', 'content': '내용'},
    {'title': '제목', 'content': '내용'},
    {'title': '제목', 'content': '내용'},
    {'title': '제목', 'content': '내용'},
    {'title': '제목2', 'content': '내용2'},
    {'title': '제목', 'content': '내용'},
    {'title': '제목', 'content': '내용'},
    {'title': '제목', 'content': '내용'},
    {'title': '제목', 'content': '내용'},
    {'title': '제목2', 'content': '내용2'},
    {'title': '제목', 'content': '내용'},
    {'title': '제목', 'content': '내용'},
    {'title': '제목', 'content': '내용'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView.builder(
        itemCount: arr.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: Text(arr[index].values.first,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BoardView(
                                arr[index].values.first,
                                arr[index].values.last)));
                  },
                  subtitle: Text(arr[index].values.last,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
