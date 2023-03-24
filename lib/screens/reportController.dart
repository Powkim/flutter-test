
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
  bool onTitle = false;
String title = "0";

 String typeList=""; 

void checkedList() {
    reportList.value=[];
    onType=false;
    isLast.value=false;
   onTitle = false;
page.value=0;
    title=title;
    reportfunction();
  }

// final MyWidget call = Get.find<MyWidget>();
Future<void> reportfunction() async {
  httpstatus.value=page==0?Httpstatus.loading:Httpstatus.loadingmore;
  var resultList = await Get.find<MyWidget>().getHttp(page.value,typeList,title );
  for(int i=0;i<resultList.length;i++){
    reportList.add(ReportModel.fromJson(resultList[i])) ;    
  } 
  httpstatus.value=Httpstatus.success;
  if(resultList.length<15){
    isLast.value=true;
  }
else{
    page.value+=1;
  }

  httpstatus.value=Httpstatus.empty;

}
Future<bool> postfunction()async{
var result = await Get.find<MyWidget>().postHttp() ;
if(result['code']=='200'&&result['message']=="success"){
return true;
}
return false;
}
}