import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Boardlist {
   int? id;
   String? title;
   String? content;
Boardlist({this.id,this.title,this.content});
  }
class Boardcontroller extends GetxController{
  
   RxList<Boardlist> arr = <Boardlist>[].obs;
addData(title,content){

  arr.add(Boardlist(title:title,content:content,id:arr.length+1));arr.refresh();}
editData(title,content,idx){
  arr[idx].title=title;
  arr[idx].content=content; 
  arr.refresh();
  }  
deleteData(index)=>arr.removeWhere((element) => element.id == arr[index].id);

}

