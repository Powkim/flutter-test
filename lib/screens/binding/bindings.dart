import 'package:get/get.dart';
import 'package:toonflix/screens/controller/gridController.dart';
import 'package:toonflix/screens/controller/posting_comment_controller.dart';
import 'package:toonflix/screens/controller/reportController.dart';
import 'package:toonflix/screens/repository/http_protocol.dart';



class AppBindings extends Bindings {
  @override
  void dependencies() {
     Get.put<ReportController>(ReportController());
     Get.put<HttpProtocol>(HttpProtocol());
     Get.put<GridController>(GridController());
     Get.put<PostingCommentController>(PostingCommentController());
  }
}