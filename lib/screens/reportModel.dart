class ReportModel {
  int? id;
  String? type;
  String? idOfType;
  UserId? userId;
  String? reportOptionTitle;
  List<int>? createdAt;

  ReportModel(
      {this.id,
      this.type,
      this.idOfType,
      this.userId,
      this.reportOptionTitle,
      this.createdAt});

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    idOfType = json['idOfType'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    reportOptionTitle = json['reportOptionTitle'];
    createdAt = json['createdAt'].cast<int>();
  }


}

class UserId {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;

  UserId({this.id, this.name, this.phoneNumber, this.email});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
  }



}
class ReportTitle {
  String? title;

  ReportTitle({this.title});

  ReportTitle.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  
  }

}