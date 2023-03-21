
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
enum Typelist {ALL,POST,ROOM,USER}
enum Titlelist {A,B,C,D,E,F,G,H}
//         final titleFiilter=["","차별적인 발언","대화 방해","광고","성희롱","불법"];

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
        final titlelist=["id","type","OptionTitle","createAt","Userid","name","phonenumber","email"];
        final dDay = DateTime.utc(1944, 6, 6);

 void typeHide(index) {
    setState(() {
      if(index==1){
     b.onType=!b.onType;
      }
      else {
        b.onTitle=!b.onTitle;
      }
    });
  }
 
    Typelist _typelist = Typelist.ALL;    // final MyWidget call = Get.put(MyWidget());
    Titlelist _titlelist = Titlelist.A;    // final MyWidget call = Get.put(MyWidget());

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
  void onTop(){
    scrollController.jumpTo(0);
   }
// void callFilter(){
  
// }
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
                       TextButton(onPressed:()=>typeHide(index), child: Text('${titlelist[index]}',style: TextStyle(fontWeight: FontWeight.bold),)
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
                                   headerTitle(b.reportList[index].id.toString()),
                                   headerTitle(b.reportList[index].type.toString()),
                                   headerTitle(b.reportList[index].reportOptionTitle.toString()),
                                   headerTitle(
                                    
                                    b.reportList[index].createdAt.toString()),
                                  headerTitle(b.reportList[index].idOfType.toString()),
                                   headerTitle(b.reportList[index].userId!.name.toString()),
                                  headerTitle(b.reportList[index].userId!.phoneNumber.toString()),
                                  headerTitle(b.reportList[index].userId!.email.toString()),
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
      radioBtn("ALL",Typelist.ALL,_typelist),
      radioBtn("POST",Typelist.POST,_typelist),
      radioBtn("USER",Typelist.USER,_typelist),
      radioBtn("ROOM",Typelist.ROOM,_typelist),
             Row(
              children: [                
                   TextButton(onPressed: ()=>typeHide(1), child: Text('취소'))
              ],
             )

    ],
  ),

)
 ,)
,visible: b.onType
)
,
Visibility(child: Positioned(
  
  top:0,left:400,child:
Container(
  width:200,
  height:260,
decoration: BoxDecoration(border: Border.all(),color: Colors.white,
),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      
      // radioBtn("폭언 및 욕설",Titlelist.A,_titlelist),
        Row(
               children: [
               Radio(
              value: Titlelist.A,
              groupValue: _titlelist,
              onChanged: (value) {
                setState(() {
                 _titlelist = value!;
                 b.title="0";

                b.checkedList();

                });
              },
            ),
            const Text("All")
               ],
             ), 
       Row(
               children: [
               Radio(
              value: Titlelist.B,
              groupValue: _titlelist,
              onChanged: (value) {
                setState(() {
                 _titlelist = value!;
                 b.title="1";

                b.checkedList();

                });
              },
            ),
            const Text("폭언 및 욕설")
               ],
             ) ,
              Row(
               children: [
               Radio(
              value: Titlelist.C,
              groupValue: _titlelist,
              onChanged: (value) {
                setState(() {
                 _titlelist = value!;
                    b.title="2";
                b.checkedList();

                });
              },
            ),
            Text("차별적인 발언")
               ],
             ) ,
              Row(
               children: [
               Radio(
              value: Titlelist.D,
              groupValue: _titlelist,
              onChanged: (value) {
                setState(() {
                 _titlelist = value!;
                 b.title="3";
               b.checkedList();
                
                });
              },
            ),
            Text("대화 방해")
               ],
             ) ,
               Row(
               children: [
               Radio(
              value: Titlelist.E,
              groupValue: _titlelist,
              onChanged: (value) {
                setState(() {
                 _titlelist = value!;
                 b.title="4";
               b.checkedList();
                
                });
              },
            ),
            Text("광고")
               ],
             ) ,
               Row(
               children: [
               Radio(
              value: Titlelist.F,
              groupValue: _titlelist,
              onChanged: (value) {
                setState(() {
                 _titlelist = value!;
                 b.title="5";
               b.checkedList();
                
                });
              },
            ),
            Text("성희롱")
               ],
             ) ,
               Row(
               children: [
               Radio(
              value: Titlelist.G,
              groupValue: _titlelist,
              onChanged: (value) {
                setState(() {
                 _titlelist = value!;
                 b.title="6";
               b.checkedList();
                
                });
              },
            ),
            Text("불법")
               ],
             ) ,

      // radioBtn("차별적인 발언",Titlelist.B,_titlelist),
      // radioBtn("대화 방해",Titlelist.C,_titlelist),
      // radioBtn("광고",Titlelist.D,_titlelist),
      // radioBtn("성희롱",Titlelist.E,_titlelist),
      // radioBtn("불법",Titlelist.F,_titlelist),
      
             Row(
              children: [                
                   TextButton(onPressed: ()=>typeHide(2), child: Text('취소'))
              ],
             )

    ],
  ),

)
 ,)
,visible: b.onTitle
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

  Widget headerTitle(String content) {
    return Container(
   width: 200,
       child: Text(content,textAlign:TextAlign.center),
    );
  }
  Widget radioBtn(type,data,group){
    return    Row(
               children: [
               Radio(
              value: data,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                group==Titlelist? _titlelist = value!: _typelist = value!;
                b.typeList=type=="ALL"?'':type;
                b.checkedList();
                });
              },
            ),
            Text(type)
               ],
             ) ;
            //          Row(
            //    children: [
            //    Radio(
            //   value: Titlelist.A,
            //   groupValue: _titlelist,
            //   onChanged: (value) {
            //     setState(() {
            //      _titlelist = value!;
            //      b.title="0";

            //     b.checkedList();

            //     });
            //   },
            // ),
            // const Text("All")
            //    ],
            //  ), 

  }
}
