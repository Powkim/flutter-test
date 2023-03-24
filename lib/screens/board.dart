
import 'dart:developer';
import 'dart:html';

import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:toonflix/screens/boardState.dart';
import 'package:toonflix/screens/boardView.dart';
import 'package:toonflix/screens/board_create.dart';
import 'package:toonflix/screens/custom_colors.dart';
import 'package:toonflix/screens/reportController.dart';
import 'package:toonflix/screens/reportModel.dart';

enum Typelist {ALL,POST,ROOM,USER}
enum Titlelist {A,B,C,D,E,F,G,H}
//         final titleFiilter=["","차별적인 발언","대화 방해","광고","성희롱","불법"];

class BoardList extends StatefulWidget {
  BoardList({super.key});
  @override
  State<BoardList> createState() => _BoardListState();
}
class _BoardListState extends State<BoardList> {
  final Boardcontroller boardcontroller= Get.find();
  final ReportController reportcontroller = Get.find();
  final scrollController = ScrollController();
  final titlelist=["id","type","OptionTitle","createAt","Userid","name","phonenumber","email"];
 
 //filter on/off 확인용 함수
  void filterHide(index) {
         setState(() {
          if(index==1){
           reportcontroller.onType=!reportcontroller.onType;}
           else {
          reportcontroller.onTitle=!reportcontroller.onTitle;}
          });}
 
  Typelist _typelist = Typelist.ALL;   
  Titlelist _titlelist = Titlelist.A; 

  @override
  void initState() {
    reportcontroller.reportfunction();

    scrollController.addListener(() {
      if(scrollController.position.pixels>=scrollController.position.maxScrollExtent&& reportcontroller.isLast==false){
       reportcontroller.reportfunction();
      }
      });

  }
  void onTop(){
    scrollController.jumpTo(0);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:  Text("신고 리스트"),
        backgroundColor: customColors.get(ColorSet.talkRoomHeader),
      ),
        body: SafeArea(
         child: 
         Obx(()=> reportcontroller.httpstatus == Httpstatus.loading 
         ?  Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),))
         :  Center(
            child: Container(
            width: 1700,
            child: Column(
                    children: [
                     Container(
                      height: 50,  
                      margin:EdgeInsets.fromLTRB(0, 20,0, 0),
                       child:
                    //                    ListView(
                    //                             scrollDirection:Axis.horizontal,               
                    //                     children: titlelist.map((e) =>Container(
                    //    padding: EdgeInsets.all(10),
                    //    width: 200,
                    //    height: 50,
                    //    child:Center(
                    //     child: TextButton(
                    //           onPressed:(){},
                    //           child: Text('${e}',
                    //           style: TextStyle(fontWeight: FontWeight.bold),)
                    //     )
                    //   ),
                    //  ) ).toList()
                    //  )
                

                  ListView.builder(
                      scrollDirection:Axis.horizontal,                      itemCount: titlelist.length,
                      itemBuilder: (context, index) {
                     return Container(
                       padding: EdgeInsets.all(10),
                       width: 200,
                       height: 50,
                       child:Center(
                        child: TextButton(
                              onPressed:()=>filterHide(index),
                              child: Text('${titlelist[index]}',
                              style: TextStyle(fontWeight: FontWeight.bold),)
                        )
                      ),
                     ) ;
                     
                   },
                  )
                ),

                 Stack(
                   children: [
                     Container(
                      height:700,
                      padding:EdgeInsets.fromLTRB(0, 5,0, 0),
                      child: ListView.builder(
                      controller:scrollController,
                      itemCount: reportcontroller.reportList.length,
                      itemBuilder: (BuildContext context, int index) {
            return  Container(
                      height: 100,
                      color: Colors.white,
                      child: Column(     
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                        children: [
                         headerTitle(reportcontroller.reportList[index].id.toString()),
                         headerTitle(reportcontroller.reportList[index].type.toString()),
                         headerTitle(reportcontroller.reportList[index].reportOptionTitle.toString()),
                         headerTitle(reportcontroller.reportList[index].createdAt.toString()),
                         headerTitle(reportcontroller.reportList[index].idOfType.toString()),
                         headerTitle(reportcontroller.reportList[index].userId!.name.toString()),
                         headerTitle(reportcontroller.reportList[index].userId!.phoneNumber.toString()),
                         headerTitle(reportcontroller.reportList[index].userId!.email.toString()),
                         ],
                        ),          
                        Row(
                          children: [
                           Text(''),
                           ],
                        ),          
                      (index+1==reportcontroller.reportList.length)&&(reportcontroller.httpstatus.value == Httpstatus.loadingmore)
                      ? Center(
                          child: 
                          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),))
                      : SizedBox() 
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
                      typeBtn("ALL",Typelist.ALL,_typelist),
                      typeBtn("POST",Typelist.POST,_typelist),
                      typeBtn("USER",Typelist.USER,_typelist),
                      typeBtn("ROOM",Typelist.ROOM,_typelist),
                     Row(
                      children: [                
                       TextButton(onPressed: ()=>filterHide(1), child: Text('취소'))
                        ],
                       )
                      ],
                    ),
                  )
                ,),
                visible: reportcontroller.onType
               ),
                 Visibility(
                  child: Positioned(
                          top:0,left:400,
                          child:Container(
                          width:200,
                           height:260,
                          decoration: BoxDecoration(border: Border.all(),color: Colors.white),
                          child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          titleBtn("All", Titlelist.A, "0"),
                          titleBtn("폭언 및 욕설", Titlelist.B, "1"),
                          titleBtn("차별적인 발언", Titlelist.C, "2"),
                          titleBtn("대화 방해", Titlelist.D, "3"),
                          titleBtn("광고", Titlelist.E, "4"),
                          titleBtn("성희롱", Titlelist.F, "5"),
                          titleBtn("불법", Titlelist.G, "6")
          ,               Row(
                           children: [                
                            TextButton(onPressed: ()=>filterHide(2), child: Text('취소'))
                            ],
                           )
                          ],
                        ),
                      )
                    ,)
             ,visible: reportcontroller.onTitle
           )
          ]
        ),
      ])         
    )    
  )   
//           , floatingActionButton:
//           FloatingActionButton(child: Icon(Icons.add), onPressed: () {
//           reportcontroller.postfunction()
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
//신고 리스트 제목
  Widget headerTitle(String content) {
    return Container(
   width: 200,
       child: Text(content,textAlign:TextAlign.center),
    );
  }
//타입 필터링용 버튼
  Widget typeBtn(type,data,group){
    return    Row(
               children: [
               Radio(
              value: data,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                group==Titlelist? _titlelist = value!: _typelist = value!;
                reportcontroller.typeList=type=="ALL"?'':type;
                reportcontroller.checkedList();
                 });
                },
               ),
              Text(type)
              ],
             ) ;
            }
 //옵션 타이틀 필터링용 버튼           
  Widget titleBtn(text,enumValue,titleId){
         return Row(
               children: [
                Radio(
                value: enumValue,
                groupValue: _titlelist,
                onChanged: (value) {
                 setState(() {
                 _titlelist = value!;
                  reportcontroller.title=titleId;
                 reportcontroller.checkedList();
                  });
                },
              ),
              Text(text)
              ],
             ) ;
            }
}
