class PostingCommentModel{
  late int userId;
  late String? content; 
  late int commentNumber;
  late bool? commentOn;
  late List<dynamic>? commentLastModifiedAt;
  late List<dynamic>? commentCreatedAt;
  late List<dynamic>? posting;
  late String imageUrlMini;
  late String nickName;
  late bool? translationComment;
  
  //  late List<dynamic>? commentLikes;

   PostingCommentModel.fromJson(Map<String,dynamic> data) {
    userId = data["userId"];
    content = data["content"];
    commentNumber = data["commentNumber"];
    commentOn = data["commentOn"];
    commentLastModifiedAt = data["commentLastModifiedAt"];
    commentCreatedAt = data["commentCreatedAt"];
    posting = data["posting"];
    imageUrlMini = data["imageUrlMini"]??"";
    nickName = data["nickName"];
    translationComment = data["translationComment"];
    // commentLikes = data["commentLikes"];
        
  }

  PostingCommentModel.empty(){
    userId = 0;
    content = null;
    commentNumber = 0;
    commentOn = null;
    commentLastModifiedAt = null;
    posting = null;
    imageUrlMini = "";
    nickName = "";
    // commentLikes = null;
  }
}



