
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import '../repository/http_protocol.dart';

class BoardCreate extends StatefulWidget {
  Function? test;
  Function? editfunc;
  Function? postfunc;
  int? idx;
  String? titleEdit;
  String? contentEdit;
  bool? onEdit;
  BoardCreate({
  super.key,this.idx, this.test, this.onEdit, this.titleEdit, this.contentEdit});
  @override
  State<BoardCreate> createState() => _BoardCreateState();
}
class _BoardCreateState extends State<BoardCreate> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final HttpProtocol call = Get.find();
 void initState() {
   super.initState();
   titleController.text = (widget.onEdit?? false ? widget.titleEdit ??'' : '');
   contentController.text = (widget.onEdit?? false ? widget.contentEdit : '')!;
 }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
          // widget.onEdit! ? a.editData(titleController.text, contentController.text,widget.idx):
          // call.postHttp();
          Get.back();
         },
          icon: const Icon(Icons.add),
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
