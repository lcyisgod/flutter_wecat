import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/colors.dart';

class MessageDetailView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageDetailViewState();
  }
}

class MessageDetailViewState extends State<MessageDetailView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: 100,
                    shrinkWrap:true,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        height: 50,
                        child: Text(
                            "文字信息"
                        ),
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