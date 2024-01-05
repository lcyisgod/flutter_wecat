import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/message/widget/message_info_item.dart';

class MessageView extends StatefulWidget {

  final Function(int type,Map<String,dynamic> map)? onPressed;

  const MessageView({Key? key,this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return MessageViewState();
  }
}

class MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context,int index){
            if(index == 0) {
              return InkWell(
                  onTap: (){
                    widget.onPressed?.call(0,{});
                  },
                  child: Container(
                    color: Colours.bg_color,
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 16,
                      right: 16,
                      bottom: 10,
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
                            '搜索',
                            style: TextStyles.text6ca516,
                          )
                        ],
                      ),
                    ),
                  )
              );
            }
            return InkWell(
              onTap: () {
                widget.onPressed?.call(1,{});
              },
              child: MessageInfoItem(
                hideMessageAlert: (index % 3 == 0),
              ),
            );
          }),
    );
  }
}