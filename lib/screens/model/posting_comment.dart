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
    this.userId = data["userId"];
    this.content = data["content"];
    this.commentNumber = data["commentNumber"];
    this.commentOn = data["commentOn"];
    this.commentLastModifiedAt = data["commentLastModifiedAt"];
    this.commentCreatedAt = data["commentCreatedAt"];
    this.posting = data["posting"];
    this.imageUrlMini = data["imageUrlMini"]??"";
    this.nickName = data["nickName"];
    this.translationComment = data["translationComment"];
    // this.commentLikes = data["commentLikes"];
        
  }

  PostingCommentModel.empty(){
    this.userId = 0;
    this.content = null;
    this.commentNumber = 0;
    this.commentOn = null;
    this.commentLastModifiedAt = null;
    this.posting = null;
    this.imageUrlMini = "";
    this.nickName = "";
    // this.commentLikes = null;
  }
}



