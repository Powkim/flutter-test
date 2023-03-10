import 'package:get/get.dart';

class Boardcontroller extends GetxController{
   List<Map<String, String>> arr = [
    {'id': '1', 'title': '제목', 'content': '내용'},
    {'id': '2', 'title': '제목2', 'content': '내용2'},
    {'id': '3', 'title': '제목', 'content': '내용'},
    {'id': '4', 'title': '제목', 'content': '내용'},
    {'id': '5', 'title': '제목', 'content': '내용'},
    {'id': '6', 'title': '제목', 'content': '내용'},
    
  ] .obs;
addData()=>arr.add({'title': '제목입니다', 'content': '내용입니다.'});
}
