///朋友圈数据
class SocialCircleModel {

  SocialCircleModel({this.headerUrl,this.nickName,this.contentStr,this.iconList,this.dateStr});

  //头像
  String headerUrl;
  //昵称
  String nickName;
  //内容
  String contentStr;
  //朋友圈图片(最多九张)
  List<String> iconList;
  //时间
  String dateStr;
}