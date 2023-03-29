import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/browser.dart' as tz;
//postingmodel
class GridModel {
  String? postContent;
  List<int>? postLastModifiedAt;
  String? postCreatedAt;
  int? postCategory;
  List<PostFileList>? postFileList;
  int? userId;
  int? postCommentCount;
  int? postLikesCount;
  int? postNumber;
  bool? postOn;
  Null adminBlock;
  int? profileId;
  String? nickname;
  String? imageUrlMini;
  String? country;
  int? postCnt;
  int? searchPostCnt;
  Null isLikes;
  GridModel({
      this.postContent,
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
      this.isLikes
   });
  GridModel.fromJson(Map<String, dynamic> json) {
    postContent = json['postContent'];
    postLastModifiedAt = json['postLastModifiedAt'].cast<int>();
    // for(var i=0;i<=json['postCreatedAt'].length;i++){
    // DateTime.utc(json['postCreatedAt'][i]);
    // }
    DateTime date = json['postCreatedAt'].length==6
    ?DateTime.utc(
    json['postCreatedAt'][0],json['postCreatedAt'][1],json['postCreatedAt'][2],json['postCreatedAt'][3],json['postCreatedAt'][4],json['postCreatedAt'][5])
    :DateTime.utc(
    json['postCreatedAt'][0],json['postCreatedAt'][1],json['postCreatedAt'][2],json['postCreatedAt'][3],json['postCreatedAt'][4]);
    
    TZDateTime kstDateTime = TZDateTime.from(date, tz.getLocation('Asia/Seoul'));
    postCreatedAt=DateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초").format(kstDateTime);
    postCategory = json['postCategory'];
    if (json['postFileList'] != null) {
      postFileList = <PostFileList>[];
      json['postFileList'].forEach((v) {
        postFileList!.add(new PostFileList.fromJson(v));
      });
    }
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
}

class PostFileList {
  String? fileUrl;
  String? thumbnailUrl;
  String? type;
  bool? imageOn;
  int? sortNumber;

  PostFileList(
      {this.fileUrl,
      this.thumbnailUrl,
      this.type,
      this.imageOn,
      this.sortNumber});

  PostFileList.fromJson(Map<String, dynamic> json) {
    fileUrl = json['fileUrl'];
    thumbnailUrl = json['thumbnailUrl'];
    type = json['type'];
    imageOn = json['imageOn'];
    sortNumber = json['sortNumber'];
  }

  
}
