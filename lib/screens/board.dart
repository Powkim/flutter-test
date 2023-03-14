
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toonflix/screens/boardState.dart';
import 'package:toonflix/screens/boardView.dart';
import 'package:toonflix/screens/board_create.dart';
import 'package:toonflix/screens/httptest.dart';
import 'package:toonflix/screens/reportModel.dart';

import 'test_controller.dart';

class BoardList extends StatefulWidget {
  BoardList({super.key});


  @override
  State<BoardList> createState() => _BoardListState();
}

class _BoardListState extends State<BoardList> {
RxList<ReportModel> reportList=<ReportModel>[] .obs;
  @override
  void initState() {
    testfunction();
    super.initState();
  
  }
Future<void> testfunction() async {
  var resultList = await call.getHttp();
  String a='title';
  for(int i=0;i<resultList.length;i++){
    var reportModel;
 reportList.add(ReportModel.fromJson(resultList[i])) ;    
print(resultList[i]);
  }
 print(reportList.value)  ;
//     print(data);
// return data;
}
        final Controller c = Get.find();
        final Boardcontroller a= Get.find();
        final MyWidget call = Get.put(MyWidget());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Obx(() =>Text("${c.count}")),
leading:  IconButton(
              onPressed: () {
              Get.back();
              
              },
              icon: Icon(Icons.add),
            ),          actions: [
            
            IconButton(
              onPressed: () {
             Get.to(BoardCreate( titleEdit: '',
          contentEdit: '',
        onEdit: false));
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: SafeArea(
         child:Obx(()=> ListView.builder(
            itemCount: reportList.length,
            itemBuilder: (BuildContext context, int index) {
              print(index);
              return
Container(
                height: 170,
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(reportList[index].id.toString(),
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                      onTap: () {
                      },
                      subtitle: Text(reportList[index].type.toString(),
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
                        icon: Icon(Icons.edit))
                  ],
                ),
              );

  }))
         )    , floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment)
);
  }
}
