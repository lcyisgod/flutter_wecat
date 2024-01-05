import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/widget/distance_widget.dart';

import '../../common/res/colors.dart';

class MessageInfoItem extends StatelessWidget{

  ///是否隐藏消息提醒
  final bool hideMessageAlert;

  const MessageInfoItem({Key? key,required this.hideMessageAlert});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9f7069ccbb537742fa8946d4dd3b9624fd9025df.jpg&refer=http%3A%2F%2Fi1.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1672973706&t=d20919bee00b32dc72f6a5b4047698bf",height: 35, width: 35,fit:BoxFit.fill,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Container(
                                    child: Text(
                                      "这是名称",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12
                                      ),
                                    ),
                                  )
                              ),
                              Text(
                                "11.25",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 6
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Container(
                                    child: Text(
                                      "这是最新的聊天消息",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10
                                      ),
                                    ),
                                  )
                              ),
                              Offstage(
                                offstage: !hideMessageAlert,
                                child: Icon(
                                  Icons.message,
                                  size: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  DistanceWidget(
                    height: 0.25,
                    color: Colours.color_7766,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}