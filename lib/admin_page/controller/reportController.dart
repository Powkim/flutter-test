import 'package:get/get.dart';
import 'package:adminpage/screens/widget/report_list.dart';
import '../repository/http_protocol.dart';
import '../model/reportModel.dart';
enum Httpstatus{loading,success,empty,loadingmore,error}
class ReportController extends GetxController{
  RxList<ReportModel> reportList=<ReportModel>[] .obs;
  Rx<Httpstatus> httpstatus=Httpstatus.empty.obs;
  RxInt page=0.obs;
  RxBool isLast=false.obs;
  // 필터 on/off용 변수
  bool onType = false;
  bool onTitle = false;
  //신고리스트 호출시 쿼리로 넣어 줄 api 필터 옵션
  Typelist typeList= Typelist.ALL; 
  int title =0;
  void checkedList() {
   reportList.value=[];
   onType=false;
   isLast.value=false;
   onTitle = false;
   page.value=0;
   title=title;
  reportFunction();
  }

// 신고 리스트 요청하는 함수
  Future<void> reportFunction() async {
    httpstatus.value=page==0
   ? Httpstatus.loading
   : Httpstatus.loadingmore;
   try{
    var resultList = await Get.find<HttpProtocol>().getReportList(page.value,typeList.name=='ALL'?'':typeList.name,title );
    for(int i=0;i<resultList.length;i++){
      reportList.add(ReportModel.fromJson(resultList[i])) ;    
    } 
    if(resultList.length<15){
      isLast.value=true;
    }else{
      page.value+=1;
    }
    httpstatus.value=Httpstatus.success;
   }
   catch(e){
    httpstatus.value=Httpstatus.error;

   }
  }
}