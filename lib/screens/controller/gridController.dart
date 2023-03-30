
import 'package:get/get.dart';
import '../model/gridModel.dart';
import '../repository/http_protocol.dart';
import '../model/reportModel.dart';
//posting model 
enum Httpstatus{loading,success,empty,loadingmore}
class GridController extends GetxController{
  RxList<GridModel> gridList=<GridModel>[] .obs;
  //페이지 네이션용 변수
   //전체 버튼 리스트
  List pageBtnList=[];
  //현재 그룹에 해당하는 버튼 리스트
  RxList showBtnList=[].obs;
  int currentPage=1;
  int currentGroup =1;
  int totalGroup=0;
  int totalPage=25;
  //button list slice
  int firstNum = 0;
  int lastNum= 10;
  int pageNumberLimit = 0;
//페이지네이션 숫자 클릭시 새로운 데이터 요청하는 함수 
  void checkedList(e) {
    gridList.value=[];
    currentPage=e;
    gridFunction();
  }
//전체 게시글 요청하는 함수 
  Future<void> gridFunction() async {
    var resultList = await Get.find<HttpProtocol>().getImage(currentPage-1);
    for(int i=0;i<resultList.length;i++){
     gridList.add(GridModel.fromJson(resultList[i])) ;    
    }

  }
//페이지네이션 버튼 생성용 함수
  void pageBtnFunction(){
    for(var i=1;i<=totalPage;i++){
      final group=totalPage/10;
      totalGroup=group.ceil();
      pageBtnList.add(i);  
    } 
    pageNumberLimit=totalPage%10;
    showBtnList.value=pageBtnList.sublist(firstNum,lastNum);
  }
//페이지 네이션 화살표 클릭시 게시글 및 페이지 버튼 리스트 변경 함수
  void groupChangeFunction(String on){
    //오른쪽 화살표 클릭시 실행 될 함수 
     if(on=='plus'){
      currentGroup++;
      firstNum+=10;
      lastNum+=10;
      if(pageBtnList.length < lastNum){
        lastNum = pageBtnList.length;
        }
      showBtnList.value=pageBtnList.sublist(firstNum,lastNum);
      currentPage=firstNum+1;
      checkedList(currentPage);
      }
   //왼쪽 화살표 클릭시 실행 될 함수
    else if(on=='minus'){
     currentGroup--;   
     currentPage-=10;
     firstNum-=10;
     lastNum-=10;
     if(currentGroup==totalGroup-1){
       lastNum = pageBtnList.length-pageNumberLimit;
       }
     gridList.value=[];
     showBtnList.value=pageBtnList.sublist(firstNum,lastNum);
     checkedList(lastNum);
     }
  }
}
