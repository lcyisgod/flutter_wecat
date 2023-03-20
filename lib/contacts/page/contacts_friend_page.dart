import 'package:flutter/material.dart';
import 'package:flutter_wecat/contacts/page/contacts_add_friend_page.dart';
import 'package:flutter_wecat/contacts/view/contacts_friend_view.dart';

import 'contacts_phone_page.dart';

class ContactsFriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsFriendPageState();
  }
}

class ContactsFriendPageState extends State<ContactsFriendPage> {
  /*
  * 0:添加朋友
  * 1:查看通讯录*/
  Future _clickActionEvent(int type,dynamic data) async {
    if (type == 0) {
     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
       return ContactsAddFriendPage();
     }));
    }else {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        return  ContactsPhonePage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '新的朋友'
        ),
        actions: [
          InkWell(
            onTap: (){
             _clickActionEvent(0, null);
            },
            child: Container(
              alignment: Alignment(0,0),
              child: Text(
                  '添加朋友'
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ContactsFriendView(
            dataList: [],
            onPressed: (int type,dynamic data){
              _clickActionEvent(type, data);
            },
          ),
        ),
      ),
    );
  }
}

