import 'package:get/get.dart';

import '../httptest.dart';
import '../model/posting_comment.dart';

class PostingCommentController extends GetxController{
//comment list 
RxList <PostingCommentModel> commentList = <PostingCommentModel>[] .obs;
int page=0;
int commentCount = 0;
//call function
  Future<void> commentListClear() async {
    commentList.clear();
  }
Future<void> commentfunc(postNumber) async {

  var resultList = await Get.find<MyWidget>().getComment(postNumber, page);

  for(int i=0;i<resultList.length;i++){
    commentList.add(PostingCommentModel.fromJson(resultList[i])) ;    
  } 
}
}
