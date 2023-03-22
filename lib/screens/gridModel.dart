class GridModel {
  String? postContent;
  List<int>? postLastModifiedAt;
  List<int>? postCreatedAt;
  int? postCategory;
  List<Null>? postFileList;
  int? userId;
  int? postCommentCount;
  int? postLikesCount;
  int? postNumber;
  bool? postOn;
  Null? adminBlock;
  int? profileId;
  String? nickname;
  String? imageUrlMini;
  String? country;
  int? postCnt;
  int? searchPostCnt;
  Null? isLikes;

  GridModel(
      {this.postContent,
      this.postLastModifiedAt,
      this.postCreatedAt,
      this.postCategory,
      this.postFileList,
      this.userId,
      this.postCommentCount,
      this.postLikesCount,
      this.postNumber,
      this.postOn,
      this.adminBlock,
      this.profileId,
      this.nickname,
      this.imageUrlMini,
      this.country,
      this.postCnt,
      this.searchPostCnt,
      this.isLikes});

  GridModel.fromJson(Map<String, dynamic> json) {
    postContent = json['postContent'];
    postLastModifiedAt = json['postLastModifiedAt'].cast<int>();
    postCreatedAt = json['postCreatedAt'].cast<int>();
    postCategory = json['postCategory'];
    // if (json['postFileList'] != null) {
    //   postFileList = <Null>[];
    //   json['postFileList'].forEach((v) {
    //     postFileList!.add(new Null.fromJson(v));
    //   });
    // }
    userId = json['userId'];
    postCommentCount = json['postCommentCount'];
    postLikesCount = json['postLikesCount'];
    postNumber = json['postNumber'];
    postOn = json['postOn'];
    adminBlock = json['adminBlock'];
    profileId = json['profileId'];
    nickname = json['nickname'];
    imageUrlMini = json['imageUrlMini'];
    country = json['country'];
    postCnt = json['postCnt'];
    searchPostCnt = json['searchPostCnt'];
    isLikes = json['isLikes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postContent'] = this.postContent;
    data['postLastModifiedAt'] = this.postLastModifiedAt;
    data['postCreatedAt'] = this.postCreatedAt;
    data['postCategory'] = this.postCategory;
    // if (this.postFileList != null) {
    //   data['postFileList'] = this.postFileList!.map((v) => v.toJson()).toList();
    // }
    data['userId'] = this.userId;
    data['postCommentCount'] = this.postCommentCount;
    data['postLikesCount'] = this.postLikesCount;
    data['postNumber'] = this.postNumber;
    data['postOn'] = this.postOn;
    data['adminBlock'] = this.adminBlock;
    data['profileId'] = this.profileId;
    data['nickname'] = this.nickname;
    data['imageUrlMini'] = this.imageUrlMini;
    data['country'] = this.country;
    data['postCnt'] = this.postCnt;
    data['searchPostCnt'] = this.searchPostCnt;
    data['isLikes'] = this.isLikes;
    return data;
  }
}


