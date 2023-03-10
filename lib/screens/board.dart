import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toonflix/screens/boardState.dart';
import 'package:toonflix/screens/boardView.dart';
import 'package:toonflix/screens/board_create.dart';

import 'test_controller.dart';

class BoardList extends StatefulWidget {
  // String? title;
  // String? content;
  BoardList({super.key});

  @override
  State<BoardList> createState() => _BoardListState();
}

class _BoardListState extends State<BoardList> {
  
  // void addData(title, content) {
  //   setState(() {
  //     a.arr.add({'title': title, 'content': content});
    
  //   });
  // }
  // void editData(title, content,idx) {
  //   setState(() {
  //     a.arr[idx]['title']=title;
  //     a.arr[idx]['content']=content;
    
  //   });
  // }


        final Controller c = Get.find();
        final Boardcontroller a= Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Obx(() =>Text("${c.count}")),
leading:  IconButton(
              onPressed: () {
              Get.to(BoardCreate());
              
              },
              icon: Icon(Icons.add),
            ),          actions: [
            
            IconButton(
              onPressed: () {
             Get.to(BoardCreate());
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => BoardCreate(
                //               // test: addData,
                //               titleEdit: '',
                //               contentEdit: '',
                //               onEdit: false,
                //             )));
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: SafeArea(
          child: Obx(() =>ListView.builder(
            itemCount: a.arr.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 170,
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(a.arr[index]['title'] ?? '',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                      onTap: () {
                        
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => BoardView(
                        //             a.arr[index]['title'] ?? '',
                        //             a.arr[index]['content'] ?? '')));
                      },
                      subtitle: Text(a.arr[index]['content'] ?? '',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            a.arr.removeWhere(
                                (element) => element["id"] == a.arr[index]["id"]);
                          });
                        },
                        icon: Icon(Icons.delete_outline)),
                    IconButton(
                        onPressed: () {
                          Get.to(BoardCreate());
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => BoardCreate(
                          //             test: editData,
                          //             onEdit: true,
                          //             idx:index,
                          //             titleEdit: a.arr[index]['title'] ?? '',
                          //             contentEdit:
                          //                 a.arr[index]['content'] ?? '')));
                        },
                        icon: Icon(Icons.edit))
                  ],
                ),
              );
            },
          )),
        )     , floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment)
);
  }
}
