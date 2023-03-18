import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/widget/qrscan/qrscar_page.dart';
import 'package:flutter_wecat/contacts/view/contacts_add_friend_view.dart';

class ContactsAddFriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactAddFriendPageState();
  }
}

class ContactAddFriendPageState extends State<ContactsAddFriendPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '添加朋友'
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ContactsAddFriendView(
            onPressed: (int type,Map data) {
              this.addEvent(type, data);
            },
          ),
        ),
      ),
    );
  }

  void addEvent(int type,Map data) {
    switch (type) {
      case 2:{
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  QRSCanPage(),
        ));
      }
      break;
      default:{
        print("未定义的行为");
      }
      break;
    }
  }
}