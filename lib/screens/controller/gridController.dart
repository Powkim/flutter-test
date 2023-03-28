
import 'package:get/get.dart';
import '../model/gridModel.dart';
import '../httptest.dart';
import '../model/reportModel.dart';
//posting model 
enum Httpstatus{loading,success,empty,loadingmore}
class GridController extends GetxController{
  RxList<GridModel> gridList=<GridModel>[] .obs;
  Rx<Httpstatus> httpstatus=Httpstatus.empty.obs;
 //서버 호출용 변수
  List pageBtnList=[];
  RxList showBtnList=[].obs;
  int currentPage=1;
  int currentGroup =1;
  int totalGroup=0;
  int totalPage=25;
  int firstNum = 0;
  int lastNum= 10;
 int a = 0;
//페이지네이션 숫자 버튼 클릭시 새로운 데이터 요청하는 함수 
  void checkedList(e) {
    gridList.value=[];
    currentPage=e;
    gridfunction();
  }
 
  Future<void> gridfunction() async {
    var resultList = await Get.find<MyWidget>().getImage(currentPage-1);
    for(int i=0;i<resultList.length;i++){
     gridList.add(GridModel.fromJson(resultList[i])) ;    
    }

  }
//페이지네이션 버튼 생성용 함수
  void pageBtnfunction(){
    for(var i=1;i<=totalPage;i++){
     final group=totalPage/10;
     totalGroup=group.ceil();
     pageBtnList.add(i);  
      } 
      a=totalPage%10;
      gridList.value=[];
    showBtnList.value=pageBtnList.sublist(firstNum,lastNum);

  }
//페이지 네이션 화살표 선택시 버튼 리스트 및 게시글 변경 함수
  void groupChangefunction(String on){
     if(on=='plus'&&currentGroup<totalGroup){
      currentGroup++;
        firstNum+=10;
        lastNum+=10;
        if(pageBtnList.length < lastNum)
         {lastNum = pageBtnList.length;
        }
      showBtnList.value=pageBtnList.sublist(firstNum,lastNum);
      currentPage=firstNum+1;

      checkedList(currentPage);

        }
    else if(on=='minus'){
      currentGroup--;   
      currentPage-=10;
      firstNum-=10;
      lastNum-=10;
      if(currentGroup==totalGroup-1){
        lastNum = pageBtnList.length-a;
        }
      gridList.value=[];
      showBtnList.value=pageBtnList.sublist(firstNum,lastNum);
      checkedList(lastNum);
      }
      print(firstNum);
  }
}
