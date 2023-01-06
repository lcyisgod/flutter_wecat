import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/colors.dart';

class MessageDetailInfoItem extends StatelessWidget {

  ///聊天消息
  final Map messageData;

  const MessageDetailInfoItem({Key key, this.messageData}) : super(key: key);


  Widget createInfoItemWithData(BuildContext context,Map messageData) {
    if(messageData["userType"] == "1") {///当前消息发送人为主人
      return Container(
        padding: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 5.0,right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 30,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(3))
                ),
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 5.0),
                padding: EdgeInsets.only(left: 2.0,right: 2.0),
                child: Text(
                  messageData["message"],
                  maxLines : 9999,
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(3.0),
              child: Image.network(messageData["imageUrl"],fit: BoxFit.cover,height: 30, width: 30,),
            )
          ],
        ),
      );
    }
    return Container(
      padding: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 5.0,right: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: Image.network(messageData["imageUrl"],fit: BoxFit.cover,height: 30, width: 30,),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(
                  minHeight: 30
              ),
              decoration: BoxDecoration(
                  color: Colours.bg_color,
                  borderRadius: BorderRadius.all(Radius.circular(3))
              ),
              margin: EdgeInsets.only(left: 5.0),
              padding: EdgeInsets.only(left: 2.0,right: 2.0),
              child: Text(
                messageData["message"],
                maxLines : 9999,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return createInfoItemWithData(context, messageData);
  }
}