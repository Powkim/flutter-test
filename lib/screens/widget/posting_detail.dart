import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toonflix/screens/controller/posting_comment_controller.dart';
import 'package:toonflix/screens/etc/custom_colors.dart';

class GridDetail extends StatefulWidget {
  final gridDetailItem;
  const GridDetail({super.key,required this.gridDetailItem});
  
  @override
  State<GridDetail> createState() => _GridDetailState();
}

class _GridDetailState extends State<GridDetail> {
  final _postingCommentController = Get.find<PostingCommentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 56,
          centerTitle: false,
          title:const Padding(
          padding: EdgeInsets.only(bottom:3),
            child: Text('Grid Detail',style:TextStyle(fontSize: 18, fontFamily: "NotoSansBold",)),
          ),
          elevation: 0,
          systemOverlayStyle: Get.theme.appBarTheme.systemOverlayStyle,
         ),
        body:SafeArea(
          child: Center(
            child: Container(
              width: 1700,
              padding: const EdgeInsets.all(10),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Container(
                   decoration: BoxDecoration(
                    border:  Border(bottom: BorderSide(color:customColors.get(ColorSet.grayBorder)))
                   ),
                    child: const Text('Post',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                  ),
                  //user영역
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,    
                     children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 50,
                        width: 50,
                        child:Image.network(widget.gridDetailItem.imageUrlMini.toString(),fit: BoxFit.cover,) 
                      ),
                     Container(
                       child:Text(
                       "${widget.gridDetailItem.nickname}s Post",style:
                       const TextStyle(fontSize: 14, fontFamily: "NotoSansBold",
                       )),
                       decoration: BoxDecoration(
                       borderRadius:BorderRadius.circular(20)
                       )
                      ),
                     ],
                    ),
                    Text(widget.gridDetailItem.postCreatedAt.toString())
                   ],
                  ),
               //게시글 내용 
                  Container(
                    width: 1700,
                    decoration: BoxDecoration(
                    border: Border(
                       top: BorderSide(color:customColors.get(ColorSet.grayBorder)))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //게시글 content
                       Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(widget.gridDetailItem.postContent),
                       ),
                       //게시글 이미지
                       SizedBox(
                        width: 1200,
                        height: 150,
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10
                          ),
                          itemCount:widget.gridDetailItem.postFileList.length,
                          itemBuilder: (context, index) {
                          return Image.network(widget.gridDetailItem.postFileList[index].thumbnailUrl,fit: BoxFit.cover);
                          }
                        ,)
                       )
                    ],),
                  ),
                  Container(
                    decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(color:customColors.get(ColorSet.grayBorder)))
                    ),
                     child:
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Row(
                            children: [
                              Text('댓글 ${widget.gridDetailItem.postCommentCount} '),
                              Text('좋아요 ${widget.gridDetailItem.postLikesCount}'),
                              ],
                            ),
                            Container(
                              width:1700,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color:customColors.get(ColorSet.grayBorder)))
                              ),
                              child: Row(
                               children: const [
                                Text('Comment',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                ],
                              ),
                            ),
                      //게시글 댓글영역  
                            widget.gridDetailItem.postCommentCount>=1
                            ? SizedBox(
                            height: 200,
                              child: Obx(() => ListView.builder(itemCount: _postingCommentController.postCommentList.length,itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.network(_postingCommentController.postCommentList[index].imageUrlMini,height: 40),
                                          Text(_postingCommentController.postCommentList[index].nickName)
                                        ],
                                       ),
                                       Text( _postingCommentController.postCommentList[index].content.toString()),
                                       Text.rich(
                                        TextSpan(
                                          style: TextStyle(fontFamily: 'NotoSansBold',fontSize: 14,color:customColors.get(ColorSet.graysilver)),
                                          children: <TextSpan> [
                                          TextSpan(text:_postingCommentController.postCommentList[index].commentCreatedAt?[0].toString()??""),
                                          const TextSpan(text:"."),
                                          TextSpan(text:_postingCommentController.postCommentList[index].commentCreatedAt?[1].toString()??""),
                                          const TextSpan(text:"."),
                                          TextSpan(text:_postingCommentController.postCommentList[index].commentCreatedAt?[2].toString()??""),
                                          ]
                                        )
                                       ),
                                      ],
                                    ),),
                                ],
                               );
                              },)
                             )
                            ) 
                            : const SizedBox(), 
                    ],)
                  ,)
                  ],
                 )
                ),
              ),
             )
            );
          }
}