import 'package:get/get.dart';

import '../repository/http_protocol.dart';
import '../model/posting_comment.dart';

class PostingCommentController extends GetxController{
//comment list 
RxList <PostingCommentModel> commentList = <PostingCommentModel>[] .obs;
  int page=0;
  int commentCount = 0;
  int totalComment = 0;
  
  Future<void> commentListClear() async {
    commentList.clear();
  }

  Future<void> commentfunc(postNumber) async {
   commentList.clear();
   var resultList = await Get.find<HttpProtocol>().getComment(postNumber, page);
   for(int i=0;i<resultList.length;i++){
   commentList.add(PostingCommentModel.fromJson(resultList[i])) ;    
   } 
  }
}
