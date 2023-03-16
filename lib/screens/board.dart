
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toonflix/screens/boardState.dart';
import 'package:toonflix/screens/boardView.dart';
import 'package:toonflix/screens/board_create.dart';
import 'package:toonflix/screens/httptest.dart';
import 'package:toonflix/screens/reportController.dart';
import 'package:toonflix/screens/reportModel.dart';

import 'test_controller.dart';

class BoardList extends StatefulWidget {
  BoardList({super.key});

  @override
  State<BoardList> createState() => _BoardListState();
}
class _BoardListState extends State<BoardList> {
        final Boardcontroller a= Get.find();
        final ReportController b = Get.put(ReportController());
        final Controller c = Get.find();
final scrollController = ScrollController();
        // final MyWidget call = Get.put(MyWidget());
// RxList<ReportModel> b.reportList=<ReportModel>[] .obs;
  @override
  void initState() {
    b.testfunction();
    scrollController.addListener(() {
   if(scrollController.position.pixels>=scrollController.position.maxScrollExtent-160&& b.isLast==false){
b.testfunction();
   }
      });

    
    // print('offset:${d.scrollController.value.position.pixels}');

    // });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Obx(() =>Text("${c.count}")),
leading:  IconButton(
              onPressed: () {
              Get.back();
              
              },
              icon: const Icon(Icons.add),
            ),          actions: [
            
            IconButton(
              onPressed: () {
             Get.to(BoardCreate( titleEdit: '',
          contentEdit: '',
        onEdit: false));
              },
              icon:const Icon(Icons.add),
            )
          ],
        ),
        body: SafeArea(
         child: Obx(()=>b.httpstatus == Httpstatus.loading ? 
         Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),))
         :
         ListView.builder(
          controller:scrollController,
            itemCount: b.reportList.length,
            itemBuilder: (BuildContext context, int index) {
              return
         Container(
                height: 220,
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(b.reportList[index].id.toString(),
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                      onTap: () {
                      },
                      subtitle: Text(b.reportList[index].type.toString(),
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                    ),
               
                    IconButton(
                        onPressed: () {
                          // a.deleteData(index);
                        },
                        icon: Icon(Icons.delete_outline)),
                    IconButton(
                        onPressed: () {
                          // Get.to(BoardCreate( onEdit: true,idx:index, titleEdit: a.arr[index].title ?? '', contentEdit:a.arr[index].content??''));
                        },
                        icon: Icon(Icons.edit),
                        ),
                  (index+1==b.reportList.length)&&(b.httpstatus.value == Httpstatus.loadingmore)?
                  
                  Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),)):SizedBox()
                  ],
                ),
              );
         
         })
         
         )
       
         )    , floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment)
);
  }
}
