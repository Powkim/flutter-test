import 'dart:io';

import 'package:dio/dio.dart';
import 'package:adminpage/admin_page/repository/http_protocol_ab.dart';
class HttpProtocol implements HttpProtocolAb  {
  final dio = Dio();
  final token = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiaG9zZW9uZyBraW0iLCJpZCI6MSwiZW1haWwiOiJnaHRqZDk1N0B1bmRlcnBpbi5rciIsImhhc2giOiIgICAgICAgICJ9.YTVPz3_D4bQ79idYaucGSCFJCg9OfUnckx7GosvHQk4';
  @override
//report list 요청 함수
  Future <List<dynamic>> getReportList(int page,String type,int title) async {
  try {
    final response = await dio.get('http://10.220.210.122:8080/api/report', 
    queryParameters:
    {'type': '${type}', 'status': 'PENDING','idOfType':'','reportOptionId':'${title}','registerUserId':'0','page':'${page}','orderBy':'true'},
    options: Options(headers: 
    {'Authorization': token  }));

  return response.data['result'];
  }
  catch (e) {
   throw Exception();
  }
}
//report post 요청 함수
  // Future<Map<String,dynamic>> postHttp() async {
  // try {
  //   final response = await dio.post('https://test.kees.tv/api/report', 
  //   data: {"type":"POST","idOfType":"250","reportOptionId":6},  
  //   options: Options(headers: {'Authorization':token}));
  //   return response.data;
  // } 
  // catch (e) {
  //   throw Exception();
  // }
  // }

  
//포스팅 리스트 요청하는 함수
  @override
  Future <List<dynamic>> getPostingList(int page) async {
  try {
   final response = await dio.get('http://10.220.211.96:8080/api/posting/category_posting_list', 
   queryParameters:{'page':page, 'postCategory': '0'},
           options: Options(headers: {'Authorization':token}));
    return response.data['result'];
  } 
  catch (e) {
   throw Exception();
  }
 }
//포스팅 댓글 요청하는 함수
  Future <List<dynamic>> getCommentList(String postNumber,int page) async {
  try {
    final response = await dio.get('http://10.220.211.96:8080/api/postingComment/list', 
    queryParameters:{ "postNumber" :postNumber,  "page" : page},
            options: Options(headers: {'Authorization':token}));
    return response.data['result'];
  } 
  catch (e) {
   throw Exception();
  }
 }
}