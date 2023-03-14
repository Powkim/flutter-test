import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyWidget extends GetxController  {
MyWidget();
final dio = Dio();

Future <List<dynamic>> getHttp() async {

  final response = await dio.get('http://10.220.210.107:8080/api/report', 
  queryParameters:
   {'type': 'POST', 'status': 'PENDING','idOfType':'250','reportOptionId':'0','registerUserId':'0','page':'0','orderBy':'true'},
  options: Options(headers: 
  {'Authorization':
  'Bearer eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiaG9zZW9uZyBraW0iLCJpZCI6MSwiZW1haWwiOiJnaHRqZDk1N0B1bmRlcnBpbi5rciIsImhhc2giOiIgICAgICAgICJ9.YTVPz3_D4bQ79idYaucGSCFJCg9OfUnckx7GosvHQk4'}));
return response.data['result'];
}

void postHttp() async {
  final response = await dio.post('https://test.kees.tv/api/report', data: {}); 
}
// void deleteHttp() async {
//   final response = await dio.delete('https://dart.dev');
//   print(response);
// }
// // board => create onpressed => function call
// void patchHttp() async {
//   final response = await dio.put('https://dart.dev',data:{'title':'제목 수정','content':'내용 수정'});
//   print(response);
// }
}