import 'package:get/get.dart';
import '../repository/http_protocol.dart';
import '../model/reportModel.dart';
enum Httpstatus{loading,success,empty,loadingmore}
class ReportController extends GetxController{
  RxList<ReportModel> reportList=<ReportModel>[] .obs;
  Rx<Httpstatus> httpstatus=Httpstatus.empty.obs;
  RxInt page=0.obs;
  RxBool isLast=false.obs;
  //
  bool onType = false;
  bool onTitle = false;
  //신고리스트 호출시 쿼리로 넣어 줄 api 필터 옵션
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

// 신고 리스트 호출하는 함수
  Future<void> reportfunction() async {
   httpstatus.value=page==0?Httpstatus.loading:Httpstatus.loadingmore;
   var resultList = await Get.find<HttpProtocol>().getHttp(page.value,typeList,title );
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
//신고 post요청 하는 함수
  // Future<bool> postfunction()async{
  // var result = await Get.find<HttpProtocol>().postHttp() ;
  // if(result['code']=='200'&&result['message']=="success"){
  //  return true;
  //  }
  //  return false;
  // }
}