import 'package:flutter/material.dart';
import 'package:flutter_wecat/message/message_detail_page.dart';
import 'package:flutter_wecat/message/view/message_view.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MessagePageState();
  }
}

class MessagePageState extends State<MessagePage> {

  Future _clickActionEvent(int type, Map data) async {
    if(type == 0) {
      print("搜索消息");
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        return MessageDetailPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: Text(
         '微信'
       ),
       actions: [
         IconButton(
             onPressed: (){},
             icon: Icon(Icons.add))
       ],
     ),
     body: SafeArea(
       child: Center(
         child: MessageView(
           onPressed: (int type,dynamic data) {
             _clickActionEvent(type, data);
           },
         ),
       ),
     ),
   );
  }
}