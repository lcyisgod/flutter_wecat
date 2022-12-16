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
         child: InkWell(
           child: DecoratedBox(
             decoration: BoxDecoration(
               gradient: LinearGradient(colors: [Colors.red,Colors.orange.shade700]),
               borderRadius: BorderRadius.circular(3),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black54,
                   offset: Offset(2.0, 2.0),
                   blurRadius: 4.0
                 )
               ]
             ),
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 18.0),
               child: Text(
                   '微信',
                   style: TextStyle(color: Colors.white)
               )
             ),
           ),
           onTap: (){
             print("点击事件");
           },
         ),
       ),
     ),
   );
  }
}