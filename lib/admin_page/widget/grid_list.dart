import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import '../controller/grid_controller.dart';
import '../controller/posting_comment_controller.dart';
import 'posting_detail.dart';

class GridList extends StatefulWidget {
  const GridList({super.key});
  @override
  State<GridList> createState() => _GridListState();
}
class _GridListState extends State<GridList> {
  final GridController _gridController = Get.find();
  final scrollController = ScrollController();
  final PostingCommentController _postingCommentController = Get.find();
bool busy = false ;
 int loadingIndex = 0;
  //전체 게시글 리스트 및 페이지네이션용 버튼 호출
  @override
  void initState() {
    _gridController.gridFunction();
    _gridController.pageBtnFunction();
    super.initState();
  }
  //페이지번호 클릭시 새로운 썸네일 리스트 호출하는 함수
  void onClickpage(page){
   _gridController.pageClickFuntion(page);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gridlist')),
      body:
      SafeArea(
        child:
        Obx(() => _gridController.httpStatus.value==Httpstatus.loading
        ? const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),))
        : Column( children: [
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
                  itemCount: _gridController.gridList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return 
                    GestureDetector(
                //grid 선택시 상세 보기로 이동
                      onTap: () {
                        print('click');
                        setState(() {
                          if(!busy){
                           busy=true;
                           loadingIndex=index;
                          _postingCommentController.commentFunc(_gridController.gridList[index].postNumber.toString())  
                          .then((value) {
                            Get.to(GridDetail(gridDetailItem: _gridController.gridList[index]));
                            busy=false;
                          })
                          .onError((error, stackTrace) {
                           MotionToast.error(
	                          title: const Text("게시글 조회 실패"),
	                          description: const  Text("Example of success motion toast")).show(context) ;
                            _gridController.httpStatus.value=Httpstatus.error;
                            busy=false;
                            return null;
                          }); 
                        }

                        });
                      },
                      child:SizedBox(
                        width: 1700,
                        child: (loadingIndex==index)&&(_gridController.httpStatus.value==Httpstatus.detailLoading)
                      //게시글 선택시 loading  
                        ? const Center(
                              child: 
                              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),)) 
                        : Container(
                          // 게시글에 사진이 있으면 게시글 썸네일 이미지, 없으면 프로필 이미지
                          child: _gridController.gridList[index].postFileList!.isEmpty 
                            ? Image.network(_gridController.gridList[index].imageUrlMini.toString(),fit: BoxFit.cover)
                            : Image.network(_gridController.gridList[index].postFileList![0].thumbnailUrl.toString(),fit: BoxFit.cover),
                        ) 
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
              _gridController.currentGroup>1 
                ? TextButton(
                  onPressed:(()=>{
                  _gridController.groupChangeFunction('minus')}), 
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
                    _gridController.showBtnList.map((page) =>
                      TextButton(onPressed:(()=>onClickpage(page)),
                    child: Text(page.toString(),style: TextStyle(color: page==_gridController.currentPage?Colors.red:Colors.blue),)
                    )).toList()
                  ),
                ),
                //현재 페이지 그룹이 마지막 페이지 그룹보다 작을 때  
                _gridController.currentGroup<_gridController.totalGroup 
                  ? TextButton(onPressed:(()=>{_gridController.groupChangeFunction('plus')}) , 
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
             