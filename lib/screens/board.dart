
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:toonflix/screens/boardState.dart';
import 'package:toonflix/screens/boardView.dart';
import 'package:toonflix/screens/board_create.dart';
import 'package:toonflix/screens/custom_colors.dart';
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
        final titlelist=["id","type","title","createAt","Userid","name","phonenumber","email"];
        // final MyWidget call = Get.put(MyWidget());
// RxList<ReportModel> b.reportList=<ReportModel>[] .obs;
  @override
  void initState() {
    b.testfunction();
    scrollController.addListener(() {
   if(scrollController.position.pixels>=scrollController.position.maxScrollExtent&& b.isLast==false){
b.testfunction();
   }
  });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Text("신고 리스트"),
          backgroundColor: customColors.get(ColorSet.talkRoomHeader)
// leading: 
//  IconButton(
//               onPressed: () {
//               Get.back();
              
//               },
//               icon: const Icon(Icons.add),
//             ),          actions: [
            
        //     IconButton(
        //       onPressed: () {
        //      Get.to(BoardCreate( titleEdit: '',
        //   contentEdit: '',
        // onEdit: false));
        //       },
        //       icon:const Icon(Icons.add),
        //     )
          // ],
        ),
        body: SafeArea(
         child: 
         Obx(()=>b.httpstatus == Httpstatus.loading ? 
         Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),))
         :
         Center(
           child: Container(
            width: 1600,
             child: Column(
               children: [
                Container(
                  height: 50,  
                  decoration: 
                  BoxDecoration(border: Border.all()),
                  margin:EdgeInsets.fromLTRB(0, 20,0, 0),
                  child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                   itemCount: titlelist.length,
                   itemBuilder: (context, index) {
                     return Container(
                         padding: EdgeInsets.all(10),
                      width: 200,
                       height: 50,
                 child: Center(child: Text('${titlelist[index]}',style: TextStyle(fontWeight: FontWeight.bold),)),
                     ) ;
                   },
                  )
                ,),
                 Container(
                  height:800,
                padding:EdgeInsets.fromLTRB(0, 5,0, 0),
                   child: ListView.builder(
                    controller:scrollController,
                      itemCount: b.reportList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return 
                   Container(
                          height: 75,
                          color: Colors.white,
                        
                          child: Column(
                               
   mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Row(
                               
                                  children: [
                                    test(b.reportList[index].id.toString()),
                                     test(b.reportList[index].type.toString()),
                                    test(b.reportList[index].reportOptionTitle.toString()),
                                    test(b.reportList[index].createdAt.toString()),
                                    test(b.reportList[index].idOfType.toString()),
                                    test(b.reportList[index].userId!.name.toString()),
                                    test(b.reportList[index].userId!.phoneNumber.toString()),
                                   test(b.reportList[index].userId!.email.toString()),

                                   
                              //  Container(
                              //   width: 200,
                              //    child:Text(b.reportList[index].id.toString(),textAlign:TextAlign.center,)),

                              // Container(
                              //   width: 200,
                              //    child:Text(b.reportList[index].type.toString(),textAlign:TextAlign.center,)),
                              //  Container(
                              //   width: 200,
                              //    child:Text(b.reportList[index].reportOptionTitle.toString(),textAlign:TextAlign.center,)),
                              // Container(
                              //   width: 200,
                              //    child:Text(b.reportList[index].createdAt.toString(),textAlign:TextAlign.center,)),
                              // Container(
                              //   width: 200,
                              //    child:Text(b.reportList[index].idOfType.toString(),textAlign:TextAlign.center,)),
                              // Container(
                              //   width: 200,
                              //    child:Text(b.reportList[index].userId!.name.toString(),textAlign:TextAlign.center,)),
                              // Container(
                              //   width: 200,
                              //    child:Text(b.reportList[index].userId!.phoneNumber.toString(),textAlign:TextAlign.center,)),
                              // Container(
                              //   width: 200,
                              //    child:Text(b.reportList[index].userId!.email.toString(),textAlign:TextAlign.center,)),

                              //   Text(b.reportList[index].reportOptionTitle.toString()),
                              //   Text(b.reportList[index].createdAt.toString()),
                              //   Text(b.reportList[index].type.toString()),
                              //  Text(b.reportList[index].idOfType.toString()),
                 ],),          
                             Row(children: [
                               Text(''),
                 ],),                    
                              
                                // title: Text(b.reportList[index].id.toString(),
                                //     style:  TextStyle(
                                //         fontSize: 18, color: customColors.get(ColorSet.bluelight))),
                                // onTap: () {
                                // },
                                // subtitle: Text(b.reportList[index].type.toString(),
                                //     style: const TextStyle(
                                //         fontSize: 18, color: Colors.black)),
                              
                         
                              // IconButton(
                              //     onPressed: () {
                              //       // a.deleteData(index);
                              //     },
                              //     icon: Icon(Icons.delete_outline)),
                              // IconButton(
                              //     onPressed: () {
                              //       // Get.to(BoardCreate( onEdit: true,idx:index, titleEdit: a.arr[index].title ?? '', contentEdit:a.arr[index].content??''));
                              //     },
                              //     icon: Icon(Icons.edit),
                              //     ),
                 
                 
                            (index+1==b.reportList.length)&&(b.httpstatus.value == Httpstatus.loadingmore)?
                            
                            Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),)):SizedBox()
                            ],
                          ),
                        );
                   
                   }),
                 ),
               ],
             ),
           ),
         )
         
         )
       
         )   
//           , floatingActionButton:
//           FloatingActionButton(child: Icon(Icons.add), onPressed: () {
//           b.postfunction()
//           .then((value) { 
// if(value){
//  MotionToast.success(
// 	              title:  const Text("신고성공"),
//               	description:  const Text("Example of success motion toast"),
//                 ).show(context);
// }
// else{
//   MotionToast.error(
// 	             title: const Text("신고실패"),
// 	             description: const  Text("Example of success motion toast"),
//                 ).show(context) ;
// }           
//  }).onError((error, stackTrace) {
//                 MotionToast.error(
// 	             title: const Text("신고실패"),
// 	             description: const  Text("Example of success motion toast"),
//                 ).show(context) ;
//           });
//           // .onError((error, stackTrace) =>);
//             })
);
  }

  Widget test(String content) {
    return Container(
   width: 200,
      color: Colors.red,
       child: Text(content,textAlign:TextAlign.center),
    );
  }
}
