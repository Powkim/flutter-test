import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:toonflix/screens/board.dart';
import 'package:toonflix/screens/boardState.dart';
import 'package:toonflix/screens/custom_colors.dart';
import 'package:toonflix/screens/test_controller.dart';

class Statetest extends StatefulWidget {
  const Statetest({super.key});

  @override
  State<Statetest> createState() => _StatetestState();
}

class _StatetestState extends State<Statetest> {

  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());
final Boardcontroller a= Get.put(Boardcontroller());
      // final Controller c = Get.find();


    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title:Text("관리자 페이지"),backgroundColor: customColors.get(ColorSet.talkRoomHeader),),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(child: Container(
    height: 200,
        child: Column(
          children: [
            // InkResponse(),
            // Container(),
            ElevatedButton(  
              style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(customColors.get(ColorSet.graypress) ), 
              ),
              
                    child: Text("신고 리스트",style: TextStyle(color:customColors.get(ColorSet.talkRoomHeader)),), 
                    onPressed: () => Get.to(BoardList()),
            )
                    ,
                    SizedBox(height: 20,),
             ElevatedButton(
                            style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(customColors.get(ColorSet.graypress) ), ),

                    child: Text(""), onPressed: () => Get.to(Other()))

          ],
          
        ),
      )),
      // floatingActionButton:
      //     FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment)
          );
  }

}
class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context){
     // Access the updated count variable
     return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
