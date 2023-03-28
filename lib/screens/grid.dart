import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/controller/gridController.dart';
import 'controller/posting_comment_controller.dart';
import 'report_detail.dart';

class GridList extends StatefulWidget {
  const GridList({super.key});

  @override
  State<GridList> createState() => _GridListState();
}
class _GridListState extends State<GridList> {
   final GridController gridcontroller = Get.find();
   final scrollController = ScrollController();
  final PostingCommentController _postingCommentController = Get.find();
@override
  void initState() {
    gridcontroller.gridfunction();
    gridcontroller.pageBtnfunction();
    super.initState();
  }
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
             Obx(() => 
        Column(
          children: [
              Center(
                child: Container(
                  width: 1700,
                  height: 600,
                  child: 
                  GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                            ),
                            itemCount: gridcontroller.gridList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return
               GestureDetector(
        onTap: () {
          final grdiDetailItem=gridcontroller.gridList[index];
          Get.to(GridDetail(gridDetailItem: grdiDetailItem,));
            _postingCommentController.commentListClear();
_postingCommentController.commentfunc(gridcontroller.gridList[index].postNumber.toString());
        },
        child:  Container(
                    width: 1700,
                    // color: Colors.grey,
                    child:
                    gridcontroller.gridList[index].postFileList!.isEmpty 
                     ?Image.network(gridcontroller.gridList[index].imageUrlMini.toString(),fit: BoxFit.cover

                      )
                     :Image.network(gridcontroller.gridList[index].postFileList![0].thumbnailUrl.toString(),fit: BoxFit.cover
                                             

                      ) 
                  )
                 ,
        );
                            },
                      ),
                ),
              ),
   
        Center(
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
          gridcontroller.currentGroup>1 ?  
          TextButton(onPressed:(()=>{gridcontroller.groupChangefunction('minus')}), child: Text('◀'))
          :
          const SizedBox()
       ,
           Container(
             width: 600,
             height: 100,
            child: ListView(
            scrollDirection:Axis.horizontal,
            children:           
            gridcontroller.showBtnList.map((e) =>
              TextButton(
              onPressed:(()=>onClickpage(e)),
              child: Text(e.toString(),style: TextStyle(color: e==gridcontroller.currentPage?Colors.red:Colors.blue),)
            )).toList()
          ),
        ),
         gridcontroller.currentGroup<gridcontroller.totalGroup 
         ? TextButton(onPressed:(()=>{gridcontroller.groupChangefunction('plus')}) , child: Text('▶'))
         : const SizedBox()
            ]   
         ),
        )

          ],
        )   ),)  
    );
  }
}
             