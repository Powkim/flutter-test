
import 'package:get/get.dart';
import '../model/gridModel.dart';
import '../repository/http_protocol.dart';
//posting model 
enum Httpstatus{loading,success,empty,error}
class GridController extends GetxController{
  RxList<GridModel> gridList=<GridModel>[] .obs;
  Rx<Httpstatus> httpStatus=Httpstatus.empty .obs;
  //페이지 네이션용 변수
   //전체 버튼 리스트
  List pageBtnList=[];
  //현재 그룹에 해당하는 버튼 리스트
  RxList showBtnList=[].obs;
  int currentPage=1;
  int currentGroup =1;
  int totalGroup=0;
  int totalPage=25;
  int firstNum = 0;
  int lastNum= 10;
  int pageNumberLimit = 0;
//페이지네이션 숫자 클릭시 새로운 데이터 요청하는 함수 
  void pageClickFuntion(e) {
    gridList.value=[];
    currentPage=e;
    gridFunction();
  }
//전체 게시글 요청하는 함수 
  Future<void> gridFunction() async {
    httpStatus.value=Httpstatus.loading;
    try{
     var resultList = await Get.find<HttpProtocol>().getPostingList(currentPage-1);
      for(int i=0;i<resultList.length;i++){
        gridList.add(GridModel.fromJson(resultList[i])) ;    
      }
     httpStatus.value=Httpstatus.success;
    }
    catch(e){
      httpStatus.value=Httpstatus.error;
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
  void groupChangeFunction(String type){
    //오른쪽 화살표 클릭시 실행 될 함수 
     if(type=='plus'){
      currentGroup++;
      firstNum+=10;
      lastNum+=10;
        if(pageBtnList.length < lastNum){
          lastNum = pageBtnList.length;
          }
      showBtnList.value=pageBtnList.sublist(firstNum,lastNum);
      pageClickFuntion(firstNum+1);
     }
   //왼쪽 화살표 클릭시 실행 될 함수
     else if(type=='minus'){
      currentGroup--;   
      currentPage-=10;
      firstNum-=10;
      lastNum-=10;
       //마지막 페이지에서 왼쪽 화살표 클릭시 실행
        if(currentGroup==totalGroup-1){
          lastNum = pageBtnList.length-pageNumberLimit;
          }
      showBtnList.value=pageBtnList.sublist(firstNum,lastNum);
      pageClickFuntion(lastNum);
     }
  }
}
