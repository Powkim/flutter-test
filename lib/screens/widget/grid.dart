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
    gridcontroller.gridfunction();
    gridcontroller.pageBtnfunction();
    super.initState();
  }
  //페이지번호 클릭시 새로운 리스트 호출하는 함수
  void onClickpage(e){
   gridcontroller.checkedList(e);
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
           Container(
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
            onTap: () {
          // final grdiDetailItem=gridcontroller.gridList[index];
            Get.to(GridDetail(gridDetailItem: gridcontroller.gridList[index],));
            _postingCommentController.commentListClear();
            _postingCommentController.commentfunc(gridcontroller.gridList[index].postNumber.toString());
             //?
            _postingCommentController.totalComment=gridcontroller.gridList[index].postCommentCount!;
            },
            child:Container(
             width: 1700,
             child: gridcontroller.gridList[index].postFileList!.isEmpty 
           ? Image.network(gridcontroller.gridList[index].imageUrlMini.toString(),fit: BoxFit.cover)
           : Image.network(gridcontroller.gridList[index].postFileList![0].thumbnailUrl.toString(),fit: BoxFit.cover) 
            ),
           );
          },
         ),
        ),
       ),
        Center(
          child:Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children:[
           gridcontroller.currentGroup>1 
         ? TextButton(
            onPressed:(()=>{
            gridcontroller.groupChangefunction('minus')}), 
            child: Text('◀')
          )
         : const SizedBox(),
             Container(
              width: 600,
              height: 100,
              child: ListView(
              scrollDirection:Axis.horizontal,
              children:           
              gridcontroller.showBtnList.map((e) 
              =>TextButton(onPressed:(()=>onClickpage(e)),
              child: Text(e.toString(),style: TextStyle(color: e==gridcontroller.currentPage?Colors.red:Colors.blue),)
              )).toList()
             ),
            ),
            //현재 페이지 그룹이 마지막 페이지 그룹보다 작을 때  
            gridcontroller.currentGroup<gridcontroller.totalGroup 
            ? TextButton(onPressed:(()=>{gridcontroller.groupChangefunction('plus')}) , 
                             child: Text('▶'))
            : const SizedBox()
           ]   
          ),
        )
       ],
      )),)  
    );
  }
}
             