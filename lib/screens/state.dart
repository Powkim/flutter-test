import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:toonflix/screens/board.dart';
import 'package:toonflix/screens/boardState.dart';
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
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(child: Row(
        children: [
          ElevatedButton(
            
                  child: Text("Go to Other"), onPressed: () => Get.to(Other())),
                   ElevatedButton(
            
                  child: Text("to Other"), onPressed: () => Get.off(BoardList()))
        ],
      )),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
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
