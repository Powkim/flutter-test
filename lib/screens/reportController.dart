
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
    page.value=0;
    reportList.value=[];
    onType=false;
    isLast.value=false;
   onTitle = false;

    title=title;
    testfunction();
    print('${reportList.value}');
  }

// final MyWidget call = Get.find<MyWidget>();
Future<void> testfunction() async {
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
    page++;
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