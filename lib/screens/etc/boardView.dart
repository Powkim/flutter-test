import 'package:flutter/material.dart';

class BoardView extends StatelessWidget {
  String? title;
  String? content;
  BoardView(this.title, this.content, {super.key});
  static String routeName = "/boastView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [Text((title ?? '')), Text((content ?? ''))],
      )),
    );
  }

  int test2() {
    return 1;
  }
}
