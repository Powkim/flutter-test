import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyWidget extends GetxController  {
MyWidget();
final dio = Dio();

void getHttp() async {
  final response = await dio.get('https://test.kees.tv/api/report',options: Options(headers: {'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiaG9zZW9uZyBraW0iLCJpZCI6MSwiZW1haWwiOiJnaHRqZDk1N0B1bmRlcnBpbi5rciIsImhhc2giOiIgICAgICAgICJ9.YTVPz3_D4bQ79idYaucGSCFJCg9OfUnckx7GosvHQk4'}));
  print(response);
}

void postHttp() async {
  final response = await dio.post('https://test.kees.tv/api/report', data: { "type":"POST","idOfType":"250","reportOptionId":3});

// void deleteHttp() async {
//   final response = await dio.delete('https://dart.dev');
//   print(response);
// }
// // board => create onpressed => function call
// void patchHttp() async {
//   final response = await dio.put('https://dart.dev',data:{'title':'제목 수정','content':'내용 수정'});
//   print(response);
// }
  
}}