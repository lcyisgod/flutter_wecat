import 'package:flutter/material.dart';
import 'package:flutter_wecat/message/view/message_detail_view.dart';

class MessageDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MessageDetailPageState();
  }
}

class MessageDetailPageState extends State<MessageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            '聊天详情'
        ),
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.add)
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: MessageDetailView(

          ),
        ),
      ),
    );
  }
}