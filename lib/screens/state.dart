import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toonflix/screens/widget/report_list.dart';
import 'package:toonflix/screens/custom_colors.dart';
import 'package:toonflix/screens/widget/grid_list.dart';
import 'package:toonflix/screens/controller/gridController.dart';
import 'controller/posting_comment_controller.dart';
import 'repository/http_protocol.dart';
import 'controller/reportController.dart';

class Statemain extends StatefulWidget {
  const Statemain({super.key});

  @override
  State<Statemain> createState() => _StatemainState();
}

class _StatemainState extends State<Statemain> {


  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("관리자 페이지"),
        backgroundColor: customColors.get(ColorSet.talkRoomHeader),
      ),
      body: Center(
          child: SizedBox(
            height: 500,
            child: Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        customColors.get(ColorSet.graypress)),
                  ),
                  child: Text(
                    "신고 리스트",
                    style:TextStyle(color: customColors.get(ColorSet.talkRoomHeader)),
                  ),
                  onPressed: () => Get.to(ReportList()),
                ),
                const SizedBox(
                  height: 20,
                 ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          customColors.get(ColorSet.graypress)),
                    ),
                    child: Text("포스트 리스트",style:
                        TextStyle(color: customColors.get(ColorSet.talkRoomHeader))),
                    onPressed: () => Get.to(const GridList())
                ),
                
              ],
            ),
          )
      ),
    );
  }
}

class Other extends StatelessWidget {

  Other({super.key});

  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("")));
  }
}
