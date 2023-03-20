import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toonflix/screens/http_protocol_ab.dart';
class MyWidget implements HttpProtocolAb  {
MyWidget();
final dio = Dio();
@override
Future <List<dynamic>> getHttp(page) async {
try {
    final response = await dio.get('http://10.220.210.122:8080/api/report', 
  queryParameters:
   {'type': 'POST', 'status': 'PENDING','idOfType':'250','reportOptionId':'0','registerUserId':'0','page':'${page}','orderBy':'true'},
  options: Options(headers: 
  {'Authorization':
  'Bearer eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiaG9zZW9uZyBraW0iLCJpZCI6MSwiZW1haWwiOiJnaHRqZDk1N0B1bmRlcnBpbi5rciIsImhhc2giOiIgICAgICAgICJ9.YTVPz3_D4bQ79idYaucGSCFJCg9OfUnckx7GosvHQk4'}));
return response.data['result'];
} catch (e) {
  return  [];
}
}

Future<Map<String,dynamic>>  postHttp() async {
  try {
      final response = await dio.post('https://test.kees.tv/api/report', data: {"type":"POST",
    "idOfType":"250",
    "reportOptionId":6},  
    options: Options(headers: 
  {'Authorization':
  'Bearer eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiaG9zZW9uZyBraW0iLCJpZCI6MSwiZW1haWwiOiJnaHRqZDk1N0B1bmRlcnBpbi5rciIsImhhc2giOiIgICAgICAgICJ9.YTVPz3_D4bQ79idYaucGSCFJCg9OfUnckx7GosvHQk4'}));
return response.data ;

  } catch (e) {
print(e);
    throw Exception();
  }
}

  @override
  Future deleteHttp() {
    // TODO: implement deleteHttp
    throw UnimplementedError();
  }

 

}