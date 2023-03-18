import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/colors.dart';
import 'package:flutter_wecat/message/widget/message_detail_info_item.dart';
import 'package:oktoast/oktoast.dart';

class MessageDetailView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageDetailViewState();
  }
}

class MessageDetailViewState extends State<MessageDetailView> {
  List<Map> dataList = [];

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i = 0; i < 10; i++) {
      Map messageData = {
        "imageUrl" : i % 3 == 0 ? "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9f7069ccbb537742fa8946d4dd3b9624fd9025df.jpg&refer=http%3A%2F%2Fi1.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1672973706&t=d20919bee00b32dc72f6a5b4047698bf" : "https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2022%2F0820%2Fa3fabb7aj00rgw36200a6d000hs00k5p.jpg&thumbnail=660x2147483647&quality=80&type=jpg",
        "message" : "这是第"+i.toString()+"条消息",
        "userType" : i % 3 == 0 ? "0" : "1"
      };
      dataList.add(messageData);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colours.bg_color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: dataList.length,
                    shrinkWrap:true,
                    itemBuilder: (BuildContext context, int index){
                      return MessageDetailInfoItem(
                        messageData: dataList[index],
                      );
                    }),
              )
            ),
          Container(
            height: 55,
            color: Colours.bg_color,
            padding: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                      onPressed: (){},
                      iconSize: 20,
                      icon: Icon(Icons.voice_chat)
                  ),
                Expanded(
                      child: Container(
                        height: 45,
                        alignment: Alignment(0,0),
                        margin: EdgeInsets.only(left: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            isCollapsed:true,
                            border: InputBorder.none,
                          ),
                          controller: controller,
                          onSubmitted: (String text) {
                            if(text.isEmpty) {
                              showToast("消息不能为空");
                              return;
                            }
                            setState(() {
                              Map dataMap = {
                                "imageUrl" : "https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2022%2F0820%2Fa3fabb7aj00rgw36200a6d000hs00k5p.jpg&thumbnail=660x2147483647&quality=80&type=jpg",
                                "message" : text,
                                "userType" : "1"
                              };
                              dataList.add(dataMap);
                              controller.clear();
                            });
                          },
                        ),
                      )
                  ),
                Container(
                    margin: EdgeInsets.only(right: 5.0),
                    child: IconButton(
                        iconSize: 20,
                        onPressed: (){},
                        icon: Icon(Icons.photo)
                    ),
                  ),
                Container(
                  child: IconButton(
                        iconSize: 20,
                        onPressed: (){},
                        icon: Icon(Icons.add)
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}