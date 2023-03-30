abstract class HttpProtocolAb {
Future <List<dynamic>> getReportList(int page,String type,int title);
Future <List<dynamic>> getCommentList(String postNumber,int page);
Future <List<dynamic>> getPostingList(int page); 

}