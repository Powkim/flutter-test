
import 'package:get/get.dart';

import 'httptest.dart';
import 'reportModel.dart';
enum Httpstatus{loading,success,empty,loadingmore}
class ReportController extends GetxController{
RxList<ReportModel> reportList=<ReportModel>[] .obs;
 Rx<Httpstatus> httpstatus=Httpstatus.empty.obs;
 RxInt page=0.obs;
  RxBool isLast=false.obs;
 bool isSucces=false ;
 bool onType = false;
  bool isCheckPost = true;
  bool isCheckUser = false;
  bool isCheckRoom = false;
 List<String> titleList=[];

void checkedList(bool isCheck, String name) {
    if (isCheck) {
      titleList.add(name);
      // Fluttertoast.showToast(
      //     msg: "$checkList 선택",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM);
    } else {
      // Fluttertoast.showToast(
      //     msg: "$name 선택 해제",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM
      // );
      titleList.remove(name);
    }
    print(titleList);
  }

// final MyWidget call = Get.find<MyWidget>();
Future<void> testfunction() async {
  httpstatus.value=page==0?Httpstatus.loading:Httpstatus.loadingmore;
  
  var resultList = await Get.find<MyWidget>().getHttp(page.value);
  for(int i=0;i<resultList.length;i++){
reportList.add(ReportModel.fromJson(resultList[i])) ;    
  } 
  httpstatus.value=Httpstatus.success;
  if(resultList.length<15){
isLast.value=true;
  }
  else{
    page++;
  }

}
Future<bool> postfunction()async{
var result = await Get.find<MyWidget>().postHttp() ;
if(result['code']=='200'&&result['message']=="success"){
return true;
}
return false;
}
}