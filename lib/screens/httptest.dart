import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyWidget extends GetxController  {
MyWidget();
final dio = Dio();

void getHttp() async {
  final response = await dio.get('https://dart.dev');
  print(response);
}

  
}