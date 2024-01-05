import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/login/widget/disover_item.dart';

class ContactsFriendView extends StatefulWidget {

  final List dataList;
  /*
  * 1:添加手机联系人
  * 2:查看联系人添加信息*/
  final Function(int type,Map<String,dynamic>? map)? onPressed;
  const ContactsFriendView({Key? key, required this.dataList,this.onPressed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsFriendViewState();
  }
}

class ContactsFriendViewState extends State<ContactsFriendView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colours.bg_color,
      padding: EdgeInsets.only(
        top: 10
      ),
      child: ListView.builder(
        itemCount: widget.dataList.length+2,
        itemBuilder: (BuildContext context,int index) {
          print(index);
          if (index == 0) {
            return Container(
              alignment: Alignment(-1,0),
              height: 40,
              padding: EdgeInsets.only(
                left: 16,
                right: 16
              ),
              child: Text(
                '你可以绑定手机,以便找到更多好友。',
              ),
            );
          }else if (index == widget.dataList.length+1) {
            return InkWell(
              onTap: (){
                widget.onPressed?.call(1,null);
              },
              child: DisoverItem(
                title: '添加手机联系人',
                imageUrl: 'assets/images/ic_new_friend.png',
                hideArrow: false,
              ),
            );
          }else {
            return Container(
              height: 50,
              color: Colors.red,
            );
          }
        },
      ),
    );
  }
}