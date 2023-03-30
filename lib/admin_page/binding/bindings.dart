import 'package:get/get.dart';
import 'package:adminpage/screens/controller/grid_controller.dart';
import 'package:adminpage/screens/controller/posting_comment_controller.dart';
import 'package:adminpage/screens/controller/reportController.dart';
import 'package:adminpage/screens/repository/http_protocol.dart';



class AppBindings extends Bindings {
  @override
  void dependencies() {
     Get.put<ReportController>(ReportController());
     Get.put<HttpProtocol>(HttpProtocol());
     Get.put<GridController>(GridController());
     Get.put<PostingCommentController>(PostingCommentController());
  }
}