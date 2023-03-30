import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/browser.dart' as tz;

class ReportModel {
  int? id;
  String? type;
  String? idOfType;
  UserId? userId;
  String? reportOptionTitle;
  String? createdAt;

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
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    reportOptionTitle = json['reportOptionTitle'];
    DateTime date = json['createdAt'].length==6
     ? DateTime.utc(
      json['createdAt'][0],json['createdAt'][1],json['createdAt'][2],json['createdAt'][3],json['createdAt'][4],json['createdAt'][5])
     : DateTime.utc(
      json['createdAt'][0],json['createdAt'][1],json['createdAt'][2],json['createdAt'][3],json['createdAt'][4]);
    TZDateTime kstDateTime = TZDateTime.from(date, tz.getLocation('Asia/Seoul'));
    createdAt=DateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초").format(kstDateTime);
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
