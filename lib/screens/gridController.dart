
import 'package:get/get.dart';
import 'gridModel.dart';
import 'httptest.dart';
import 'reportModel.dart';
enum Httpstatus{loading,success,empty,loadingmore}
class GridController extends GetxController{
RxList<GridModel> gridList=<GridModel>[] .obs;
 Rx<Httpstatus> httpstatus=Httpstatus.empty.obs;
 //서버 호출용 변수
 int currentPage=1;
 RxBool isLast=false.obs;
 bool isSucces=false ;
 List pageBtnList=[];
 RxList showBtnList=[].obs;
 int currentGroup =1;
 int totalGroup=0;
int totalPage=25;
int currentShowGroup=0;
int firstNum = 0;
int lastNum= 10;
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

void pageBtnfunction(){
  for(var i=1;i<=totalPage;i++){
    final group=totalPage/10;
    totalGroup=group.ceil();
    pageBtnList.add(i);  
} 
    gridList.value=[];
 showBtnList.value=pageBtnList.sublist(firstNum,lastNum);

}
void groupChangefunction(String on){
     if(on=='plus'&&currentGroup<totalGroup){
        print(currentPage);
        firstNum+=10;
        lastNum+=10;
        if(pageBtnList.length < lastNum) lastNum = pageBtnList.length;
           showBtnList.value=pageBtnList.sublist(firstNum,lastNum);
           checkedList(firstNum);
            currentGroup++;
        }
    else if(on=='minus'){
      currentGroup--;   
      currentPage--;
      firstNum-=10;
      lastNum-=10;
      if(currentGroup==totalGroup-1){
        lastNum = pageBtnList.length-5;
        }
      gridList.value=[];
      showBtnList.value=pageBtnList.sublist(firstNum,lastNum);
    checkedList(lastNum);
      }
 }
}
