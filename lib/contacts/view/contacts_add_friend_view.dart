import 'package:flutter/material.dart';
import 'package:flutter_wecat/contacts/view/contacts_add_firend_item.dart';

import '../../common/res/colors.dart';
import '../../common/res/styles.dart';

class ContactsAddFriendView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsAddFriendViewState();
  }
}

class ContactsAddFriendViewState extends State<ContactsAddFriendView> {
  List<Map> dataItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataItem = [
      {
        "imageUrl":"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9f7069ccbb537742fa8946d4dd3b9624fd9025df.jpg&refer=http%3A%2F%2Fi1.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1672973706&t=d20919bee00b32dc72f6a5b4047698bf",
        "title":"雷达加朋友",
        "detailTitle":"添加身边的朋友"
      },
      {
        "imageUrl":"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9f7069ccbb537742fa8946d4dd3b9624fd9025df.jpg&refer=http%3A%2F%2Fi1.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1672973706&t=d20919bee00b32dc72f6a5b4047698bf",
        "title":"面对面建群",
        "detailTitle":"与身边的朋友进入同一个群聊"
      },
      {
        "imageUrl":"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9f7069ccbb537742fa8946d4dd3b9624fd9025df.jpg&refer=http%3A%2F%2Fi1.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1672973706&t=d20919bee00b32dc72f6a5b4047698bf",
        "title":"扫一扫",
        "detailTitle":"扫描二维码名片"
      },
      {
        "imageUrl":"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9f7069ccbb537742fa8946d4dd3b9624fd9025df.jpg&refer=http%3A%2F%2Fi1.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1672973706&t=d20919bee00b32dc72f6a5b4047698bf",
        "title":"手机联系人",
        "detailTitle":"添加通讯录中的朋友"
      },
      {
        "imageUrl":"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9f7069ccbb537742fa8946d4dd3b9624fd9025df.jpg&refer=http%3A%2F%2Fi1.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1672973706&t=d20919bee00b32dc72f6a5b4047698bf",
        "title":"公众号",
        "detailTitle":"获取更多资讯和服务"
      },
      {
        "imageUrl":"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9f7069ccbb537742fa8946d4dd3b9624fd9025df.jpg&refer=http%3A%2F%2Fi1.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1672973706&t=d20919bee00b32dc72f6a5b4047698bf",
        "title":"企业微信联系人",
        "detailTitle":"通过手机号搜索企业微信用户"
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colours.bg_color,
      padding: EdgeInsets.only(
        top: 10
      ),
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context,int index){
            if(index == 0) {
              return Container(
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        color: Colours.bg_color,
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 10
                        ),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search_rounded),
                              Text(
                                '手机号/账号',
                                style: TextStyles.textMain18Body,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: 10
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '我的微信号: ccy',
                            textAlign: TextAlign.right,
                            style: TextStyles.text6ca516,
                          ),
                          Container(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/images/ic_qrcode_preview_tiny.png',
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              );
            }
            Map dataMap = dataItem[index-1];
            return ContactsAddFriendItem(
              imageUrl: dataMap["imageUrl"],
              title: dataMap["title"],
              detailTitle: dataMap["detailTitle"],
            );
          }),
    );
  }
}

