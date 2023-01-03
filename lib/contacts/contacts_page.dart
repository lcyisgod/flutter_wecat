import 'package:flutter/material.dart';
import 'package:flutter_wecat/contacts/contacts_friend_page.dart';
import 'package:flutter_wecat/contacts/models/contacts_person_model.dart';
import 'package:flutter_wecat/contacts/view/contacts_view.dart';

import 'contacts_add_friend_page.dart';
import 'contacts_detail_page.dart';

class ContactsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsPageState();
  }
}

class ContactsPageState extends State<ContactsPage> {
  List searchDataList = [];
  List dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchDataList = ['🔍','B','C','Y','Z'];
    dataList = [
      {
        'title':'',
        'data':[
          ContactsPersonModel(
              name:'新的朋友',
              userId: '-1',
              image:'assets/images/ic_new_friend.png'
          ),
          ContactsPersonModel(
              name:'群聊',
              userId: '-1',
              image:'assets/images/ic_group_chat.png'
          ),
          ContactsPersonModel(
              name:'标签',
              userId: '-1',
              image:'assets/images/ic_tag.png'
          ),
          ContactsPersonModel(
              name:'公众号',
              userId: '-1',
              image:'assets/images/ic_public_account.png'
          ),
          ContactsPersonModel(
              name:'企业微信联系人',
              userId: '-1',
              image:'assets/images/ic_mini_program.png'
          )
        ]
      },
      {
        'title':'B',
        'data':[
          ContactsPersonModel(
              name:'贝壳',
              userId: '100001',
              image:'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'
          )
        ],
      },
      {
        'title':'C',
        'data':[
          ContactsPersonModel(
              name:'曹公公',
              userId: '100002',
              image:'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'
          ),
          ContactsPersonModel(
              name:'曹正淳',
              userId: '1000010',
              image:'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'
          ),
          ContactsPersonModel(
              name:'曹雪芹',
              userId: '100005',
              image:'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'
          ),
          ContactsPersonModel(
              name:'曹格',
              userId: '100006',
              image:'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'
          ),
        ],
      },
      {
        'title':'Y',
        'data':[
          ContactsPersonModel(
              name:'嫣然',
              userId: '100009',
              image:'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'
          )
        ],
      },
      {
        'title':'Z',
        'data':[
          ContactsPersonModel(
              name:'郑大佬',
              userId: '100003',
              image:'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'
          ),
          ContactsPersonModel(
              name:'郑成功',
              userId: '100006',
              image:'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'
          ),
          ContactsPersonModel(
              name:'郑和',
              userId: '100007',
              image:'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'
          ),
          ContactsPersonModel(
              name:'郑则仕',
              userId: '100008',
              image:'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'
          ),
        ],
      },
    ];
  }

  /*
  * 0:搜索
  * 1:点击标签
  * 2:查看联系人信息*/
  Future _clickActionEvent(int type,dynamic data) async{
    Map dataMap =  data as Map;
    if (type == 0) {

    }else if (type == 1) {
      final String title = dataMap['title'];
      if (title == '新的朋友') {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context){
              return ContactsFriendPage();
            })
        );
      }
    }else {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context){
            return ContactsPersonDetailPage();
          })
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '通讯录',
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return ContactsAddFriendPage();
                }));
              })
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ContactsView(
            dataList: dataList,
            searchDataList: searchDataList,
            onPressed: (int type,dynamic data) {
              _clickActionEvent(type, data);
            },
          )
        ),
      ),
    );
  }
}