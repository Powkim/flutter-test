
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

final MyWidget call = Get.put(MyWidget());
Future<void> testfunction() async {
  httpstatus.value=page==0?Httpstatus.loading:Httpstatus.loadingmore;
  print(page);
  print(httpstatus.value);
  var resultList = await call.getHttp(page.value);
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
var result = await call.postHttp() ;
if(result['code']=='200'&&result['message']=="success"){
return true;
}
return false;
}
}