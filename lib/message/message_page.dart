import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessagePageState();
  }
}

class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
         child: Container(
           child: Text(
             '微信'
           ),
         ),
       ),
     ),
   );
  }
}