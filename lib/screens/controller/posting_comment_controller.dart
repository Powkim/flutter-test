import 'package:get/get.dart';
import '../repository/http_protocol.dart';
import '../model/posting_comment.dart';
import 'grid_controller.dart';

class PostingCommentController extends GetxController{
//comment list 
RxList <PostingCommentModel> postCommentList = <PostingCommentModel>[] .obs;
  final HttpProtocol _repo = HttpProtocol();
  final GridController _gridController = Get.find();
  int page=0;
  int commentCount = 0;
  
  Future<void> commentListClear() async {
    postCommentList.clear();
  }
//포스팅 댓글 요청 함수
//return true
  Future<void> commentFunc(postNumber) async {
    _gridController.httpStatus.value=Httpstatus.detailLoading;
    postCommentList.clear();
    await _repo.getCommentList(postNumber,page)
    .then((result) {
      for(var i in result){
           var commentList = PostingCommentModel.fromJson(i);
            postCommentList.add(commentList);
      }
      _gridController.httpStatus.value=Httpstatus.success;
    });
    // _gridController.httpStatus.value=Httpstatus.error;
  }
}