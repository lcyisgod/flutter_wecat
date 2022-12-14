import 'package:flutter/material.dart';

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
            return Container();
          }),
    );
  }
}

