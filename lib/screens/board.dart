
import 'dart:developer';
import 'dart:html';

import 'package:filter_list/filter_list.dart';
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
        final ReportController b = Get.find();
        final Controller c = Get.find();
        final scrollController = ScrollController();
        final titlelist=["id","type","title","createAt","Userid","name","phonenumber","email"];
        final typeFilter=["POST","USER","ROOM"];
        final titleFiilter=["폭언 및 욕설","차별적인 발언","대화 방해","광고","성희롱","불법"];
 void typeHide() {
    setState(() {
      b.onType = !b.onType;
    });

  }
        // final MyWidget call = Get.put(MyWidget());
// RxList<ReportModel> b.reportList=<ReportModel>[] .obs;
  @override
  void initState() {
    b.testfunction();
    print('object');
    scrollController.addListener(() {
   if(scrollController.position.pixels>=scrollController.position.maxScrollExtent&& b.isLast==false){
b.testfunction();
   }
   
  });

  }
  void onTop(){
    scrollController.jumpTo(0);
   }
void callFilter(){
  if(b.titleList.length>1){
print('초과');
  }
  else{
   print(b.titleList);
    b.testfunction();
  }
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Text("신고 리스트"),
          backgroundColor: customColors.get(ColorSet.talkRoomHeader),
         actions: [
IconButton(onPressed: (){
  print(Get.isRegistered<ReportController>());}, icon: Icon(Icons.abc)),
         ]
        ),
        body: SafeArea(
         child: 
         Obx(()=>b.httpstatus == Httpstatus.loading ? 
         Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),))
         :
         Center(
           child: Container(
            width: 1700,
             child: Column(
               children: [
                
                Container(
                  height: 50,  
                  // decoration: 
                  // BoxDecoration(border: Border.all()),
                  margin:EdgeInsets.fromLTRB(0, 20,0, 0),
                  child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemCount: titlelist.length,
                 itemBuilder: (context, index) {
                     return Container(
                       padding: EdgeInsets.all(10),
                       width: 200,
                       height: 50,
                       child: Center(child:
                       TextButton(onPressed: typeHide, child: Text('${titlelist[index]}',style: TextStyle(fontWeight: FontWeight.bold),)
                        )),
                     ) ;
                   },
                  )
                ,),
                 Stack(
                   children: [
                     Container(
                      height:700,
                     padding:EdgeInsets.fromLTRB(0, 5,0, 0),
                     child: ListView.builder(
                     controller:scrollController,
                itemCount: b.reportList.length,
                itemBuilder: (BuildContext context, int index) {
          return  Container(
                       height: 75,
                       color: Colors.white,
                      child: Column(     
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Row(
                                 children: [
                                   test(b.reportList[index].id.toString()),
                                   test(b.reportList[index].type.toString()),
                                   test(b.reportList[index].reportOptionTitle.toString()),
                                   test(b.reportList[index].createdAt.toString()),
                                  test(b.reportList[index].idOfType.toString()),
                                   test(b.reportList[index].userId!.name.toString()),
                                   test(b.reportList[index].userId!.phoneNumber.toString()),
                                  test(b.reportList[index].userId!.email.toString()),
                     ],),          
                                 Row(children: [
                                   Text(''),
                     ],),          
                                (index+1==b.reportList.length)&&(b.httpstatus.value == Httpstatus.loadingmore)?
                                
                                Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),)):SizedBox()
                                ],
                              ),
                            );
                       
                       }),
                     ),
                    Positioned(
                      bottom: 50,
                      right: 50,
                      child: IconButton(onPressed: onTop, icon:Icon(Icons.arrow_upward_outlined))),
Visibility(child: Positioned(
  
  top:0,left:200,child:
Container(
  width:200,
  height:250,
decoration: BoxDecoration(border: Border.all(),color: Colors.white,
),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
             Row(
               children: [
                 Checkbox(
                        value:b.isCheckPost ,
                        onChanged: (value) {
                          setState(() {
                           b.isCheckPost=value!;
                           b.checkedList(b.isCheckPost,"POST");
                          });
                        },
                      ),
                Text("POST")
               ],
             ),
               Row(
               children: [
                 Checkbox(
                        value:b.isCheckUser ,
                        onChanged: (value) {
                          setState(() {
                           b.isCheckUser=value!;
                           b.checkedList(b.isCheckUser,"USER");
                          });
                        },
                      ),
                Text("USER")
               ],
             ),
               Row(
               children: [
                 Checkbox(
                        value:b.isCheckRoom ,
                        onChanged: (value) {
                          setState(() {
                           b.isCheckRoom=value!;
                           b.checkedList(b.isCheckRoom,"ROOM");
                          });
                        },
                      ),
                Text("ROOM")
               ],
             ),
             Row(
              children: [                
                  TextButton(onPressed:callFilter, child: Text('필터')),
                   TextButton(onPressed: typeHide, child: Text('취소'))
              ],
             )

    ],
  ),

)
 ,)
,visible: b.onType,
)

//                    ],
//                  ),
                   ]
           ),
         ])
         
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
)));
  }

  Widget test(String content) {
    return Container(
   width: 200,
       child: Text(content,textAlign:TextAlign.center),
    );
  }
}
