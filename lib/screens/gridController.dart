
import 'package:get/get.dart';

import 'gridModel.dart';
import 'httptest.dart';
import 'reportModel.dart';
enum Httpstatus{loading,success,empty,loadingmore}
class GridController extends GetxController{
RxList<GridModel> gridList=<GridModel>[] .obs;
 Rx<Httpstatus> httpstatus=Httpstatus.empty.obs;
 RxInt page=0.obs;
  RxBool isLast=false.obs;
 bool isSucces=false ;
 bool onType = false;
  bool onTitle = false;
String title = "0";

 String typeList=""; 

void checkedList() {
    gridList.value=[];
    onType=false;
    isLast.value=false;
   onTitle = false;
page.value=0;
    title=title;
    gridfunction();
  }

// final MyWidget call = Get.find<MyWidget>();
Future<void> gridfunction() async {
  // httpstatus.value=page==0?Httpstatus.loading:Httpstatus.loadingmore;
  
  var resultList = await Get.find<MyWidget>().getImage();
  for(int i=0;i<resultList.length;i++){
    gridList.add(GridModel.fromJson(resultList[i])) ;    
  } 
  print(gridList);
}

}