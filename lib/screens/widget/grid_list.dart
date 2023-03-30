import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/gridController.dart';
import '../controller/posting_comment_controller.dart';
import 'posting_detail.dart';

class GridList extends StatefulWidget {
  const GridList({super.key});
  @override
  State<GridList> createState() => _GridListState();
}
class _GridListState extends State<GridList> {
  final GridController gridcontroller = Get.find();
  final scrollController = ScrollController();
  final PostingCommentController _postingCommentController = Get.find();
  //전체 게시글 리스트 및 페이지네이션용 버튼 호출
  @override
  void initState() {
    gridcontroller.gridFunction();
    gridcontroller.pageBtnFunction();
    super.initState();
  }
  //페이지번호 클릭시 새로운 썸네일 리스트 호출하는 함수
  void onClickpage(page){
   gridcontroller.checkedList(page);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gridlist')),
      body:
      SafeArea(
        child:
        Obx(() 
      => Column( children: [
          Center(child: 
          //썸네일 리스트 영역
           SizedBox(
          width: 1700,
          height: 600,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 8,
             mainAxisSpacing: 10,
             crossAxisSpacing: 10,
            ),
          itemCount: gridcontroller.gridList.length,
          itemBuilder: (BuildContext context, int index) {
           return GestureDetector(
           //grid 선택시 상세 보기로 이동
            onTap: () {
              Get.to(GridDetail(gridDetailItem: gridcontroller.gridList[index],));
              _postingCommentController.commentfunc(gridcontroller.gridList[index].postNumber.toString());
            },
            child:SizedBox(
             width: 1700,
             // 게시글에 사진이 있으면 게시글 썸네일 이미지, 없으면 프로필 이미지
              child: gridcontroller.gridList[index].postFileList!.isEmpty 
                ? Image.network(gridcontroller.gridList[index].imageUrlMini.toString(),fit: BoxFit.cover)
                : Image.network(gridcontroller.gridList[index].postFileList![0].thumbnailUrl.toString(),fit: BoxFit.cover) 
            ),
           );
          },
         ),
        ),
       ),
       //페이지 네이션 버튼 리스트
        Center(
          child:Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children:[
           gridcontroller.currentGroup>1 
            ? TextButton(
              onPressed:(()=>{
              gridcontroller.groupChangeFunction('minus')}), 
              child:const Text('◀')
          )
            : const SizedBox(),
            //페이지네이션 버튼 리스트
             SizedBox(
              width: 600,
              height: 100,
              child: ListView(
              scrollDirection:Axis.horizontal,
              children:           
              gridcontroller.showBtnList.map((page) 
              =>TextButton(onPressed:(()=>onClickpage(page)),
              child: Text(page.toString(),style: TextStyle(color: page==gridcontroller.currentPage?Colors.red:Colors.blue),)
              )).toList()
             ),
            ),
            //현재 페이지 그룹이 마지막 페이지 그룹보다 작을 때  
            gridcontroller.currentGroup<gridcontroller.totalGroup 
              ? TextButton(onPressed:(()=>{gridcontroller.groupChangeFunction('plus')}) , 
                             child: const Text('▶'))
              : const SizedBox()
          ]   
         ),
        )
       ],
      )),)  
    );
  }
}
             