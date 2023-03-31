
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adminpage/admin_page/etc/custom_colors.dart';
import 'package:adminpage/admin_page/controller/reportController.dart';

enum Typelist {ALL,POST,ROOM,USER}
enum TitleList {
  ALL("ALL"),
verbalAbuse("폭언 및 욕설"),
discriminatory("차별적인 발언"),
interruption("대화 방해"),
advertisement("광고"),
Harassment("성희롱"),
illegal("불법");
const TitleList(this.koreanName);
  final String koreanName;
String getKrName(){
  return koreanName;
} 
}
enum Filterindex {onTypeFilter,onTitleFilter}

class ReportList extends StatefulWidget {
  const ReportList({super.key});
  @override
  State<ReportList> createState() => _ReportListState();
}
class _ReportListState extends State<ReportList> {
  final ReportController reportcontroller = Get.find();
  final scrollController = ScrollController();
  final titlelist=["id","type","OptionTitle","createAt","Userid","name","phonenumber","email"];
 
 //filter on/off 확인용 함수
  void filterHide(Filterindex filterindex) {
       setState(() {
        switch (filterindex) {
            case Filterindex.onTypeFilter:
              reportcontroller.onType=!reportcontroller.onType;
              break;
            case Filterindex.onTitleFilter:
              reportcontroller.onTitle=!reportcontroller.onTitle;
              break;
          }
         })
          ;
        
       }
  Typelist _typelist = Typelist.ALL;   
  TitleList _titlelist = TitleList.ALL; 

  @override
  void initState() {
    reportcontroller.reportFunction();
    scrollController.addListener(() {
      if(scrollController.position.pixels>=scrollController.position.maxScrollExtent&& reportcontroller.isLast.value==false){
       reportcontroller.reportFunction();
      }
      });
    super.initState();
  }
  void onTop(){
    scrollController.jumpTo(0);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("신고 리스트"),
        backgroundColor: customColors.get(ColorSet.talkRoomHeader),
      ),
        body: SafeArea(
         child: 
         Obx(()=> reportcontroller.httpstatus.value == Httpstatus.loading 
         ? const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),))
         :  Center(
            child: SizedBox(
            width: 1700,
            child: Column(
                    children: [
                    //Reportlist header
                     Container(
                      height: 50,  
                      margin:const EdgeInsets.fromLTRB(0, 20,0, 0),
                       child: 
                     ListView.builder(
                      scrollDirection:Axis.horizontal,        
                      itemCount: titlelist.length,
                      itemBuilder: (context, index) {
                        Filterindex filterindex;
                        if(index==1){
                         filterindex= Filterindex.onTypeFilter;
                        }
                        else{
                          filterindex=Filterindex.onTitleFilter;
                        }
                       return Container(
                        padding: const EdgeInsets.all(10),
                        width: 200,
                        height: 50,
                        child:Center(
                         child: TextButton(
                                 onPressed:()=>filterHide(filterindex),
                                 child: Text(titlelist[index],
                                 style:const TextStyle(fontWeight: FontWeight.bold),)
                              )
                             ),
                        ) ;
                      },
                    )
                  ),
                   Stack(
                    children: [
                    //신고 리스트 영역
                     Container(
                      height:700,
                      padding:const EdgeInsets.fromLTRB(0, 5,0, 0),
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
                      (index+1==reportcontroller.reportList.length)&&(reportcontroller.httpstatus.value == Httpstatus.loadingmore)
                      ? const Center(
                          child: 
                          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),))
                      : const SizedBox() 
                      ],
                     ),
                   );
                  }),
                ),
                //Type 필터 영역
                  Positioned(
                      bottom: 50,
                      right: 50,
                      child: IconButton(onPressed: onTop, icon:const  Icon(Icons.arrow_upward_outlined))),
                       Visibility(  
                        child:Positioned(top:0,left:200,
                         child:
                         Container(
                          width:200,
                          height:250,
                          decoration: BoxDecoration(border: Border.all(),color: Colors.white),
                          child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             typeBtn(Typelist.ALL),
                             typeBtn(Typelist.POST),
                             typeBtn(Typelist.USER),
                             typeBtn(Typelist.ROOM),
                             Row(
                             children: [                
                              TextButton(onPressed: ()=>filterHide(Filterindex.onTypeFilter), child: const Text('취소'))
                              ],
                             )
                            ],
                           ),
                         )
                       ,),
                      visible: reportcontroller.onType
                     ),
                 //OptionTitle 필터 영역    
                 Visibility(child: 
                  Positioned(
                    top:0,left:400,
                    child:Container(
                    width:200,
                    height:260,
                    decoration: BoxDecoration(border: Border.all(),color: Colors.white),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      titleBtn(TitleList.ALL),
                      titleBtn(TitleList.verbalAbuse),
                      titleBtn(TitleList.discriminatory),
                      titleBtn(TitleList.interruption),
                      titleBtn(TitleList.advertisement),
                      titleBtn(TitleList.Harassment),
                      titleBtn(TitleList.illegal)
      ,               Row(
                        children: [                
                        TextButton(onPressed: ()=>filterHide(Filterindex.onTitleFilter), child: const Text('취소'))
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
        )));
       }
//신고 리스트 제목
  Widget headerTitle(String content) {
    return SizedBox(
   width: 200,
       child: Text(content,textAlign:TextAlign.center),
    );
  }
//타입 필터링용 버튼
  Widget typeBtn(Typelist enumValue){
    return    Row(
               children: [
               Radio(
              value: enumValue,
              groupValue: _typelist,
              onChanged: (value) {
                setState(() {
                _typelist=value!;
                reportcontroller.typeList=enumValue;
                reportcontroller.checkedList();
                 });
                },
               ),
              Text(enumValue.name)
              ],
             ) ;
            }
 //옵션 타이틀 필터링용 버튼           
  Widget titleBtn(TitleList enumValue){
         return Row(
               children: [
                Radio(
                value: enumValue,
                groupValue: _titlelist,
                onChanged: (value) {
                 setState(() {
                 _titlelist = value!;
                  reportcontroller.title=enumValue.index;
                 reportcontroller.checkedList();
                  });
                },
              ),
              Text(enumValue.koreanName)
              ],
             ) ;
            }
}
//  ListView(
// scrollDirection:Axis.horizontal,               
//  children: titlelist.map((e) =>Container(
//  padding: EdgeInsets.all(10),
//  width: 200,
//  height: 50,
//  child:Center(
//  child: TextButton(
//         onPressed:(){},
//           child: Text('${e}',
//           style: TextStyle(fontWeight: FontWeight.bold),)
//     )
//   ),
//  ) ).toList()
//  )
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
                

