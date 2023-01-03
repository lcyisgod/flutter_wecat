import 'package:flutter/material.dart';

class MessageDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageDetailPageState();
  }
}

class MessageDetailPageState extends State<MessageDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          child: Container(

          ),
        ),
      ),
    );
  }
}