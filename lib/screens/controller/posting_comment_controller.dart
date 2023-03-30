import 'package:get/get.dart';

import '../repository/http_protocol.dart';
import '../model/posting_comment.dart';

class PostingCommentController extends GetxController{
//comment list 
RxList <PostingCommentModel> postCommentList = <PostingCommentModel>[] .obs;
  final HttpProtocol _repo = HttpProtocol();
  int page=0;
  int commentCount = 0;

  
  Future<void> commentListClear() async {
    postCommentList.clear();
  }
//포스팅 댓글 요청 함수
  Future<void> commentfunc(postNumber) async {
    postCommentList.clear();
  await _repo.getCommentList(postNumber,page).then((result) {
        if(result !=null){
          for(var i in result){
          var commentList = PostingCommentModel.fromJson(i);
          postCommentList.add(commentList);
          }
        }
      });
  
  //  commentList.clear();
  //  var resultList = await Get.find<HttpProtocol>().getComment(postNumber, page);
  //  for(int i=0;i<resultList.length;i++){
  //  commentList.add(PostingCommentModel.fromJson(resultList[i])) ;    
  //  } 
  }
  
}