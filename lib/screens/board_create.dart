import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BoardCreate extends StatefulWidget {
  Function test;
  BoardCreate({super.key, required this.test});

  @override
  State<BoardCreate> createState() => _BoardCreateState();
}

void sendData() {}

class _BoardCreateState extends State<BoardCreate> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            widget.test(titleController.text, contentController.text);
            // Navigator.popUntil(context, ModalRoute.withName("/"));
            Navigator.of(context).pop();

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => Boardlist(
            //             test(titleController.text, contentController.text))));
          },
          icon: Icon(Icons.add),
        )
      ]),
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: titleController,
          ),
          TextField(
            controller: contentController,
          ),
        ],
      )),
    );
  }
}
