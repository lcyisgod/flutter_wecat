import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_wecat/common/res/colors.dart';
import 'package:flutter_wecat/common/widget/distance_widget.dart';

class ContactsPhoneInfoItem extends StatelessWidget{

  final Contact contact;

  final bool isFriend;

  const ContactsPhoneInfoItem({Key? key,required this.contact,required this.isFriend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.only(left: 5.0,right: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9f7069ccbb537742fa8946d4dd3b9624fd9025df.jpg&refer=http%3A%2F%2Fi1.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1672973706&t=d20919bee00b32dc72f6a5b4047698bf",width: 20,height: 20,fit: BoxFit.fill,),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Column(
                        children: [
                          Container(
                            height: 20,
                            alignment: Alignment.centerLeft,
                            child: Text(
                                '${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'
                            ),
                          ),
                          Container(
                            height: 20,
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "姓名: "+contact.displayName,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      if (isFriend) {
                        return;
                      }
                    },
                    child: Container(
                      width: 30,
                      height: 15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isFriend?Colors.white:Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                      child: Text(
                        isFriend?"已添加":"添加",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          DistanceWidget(
            height: 0.25,
            color: Colours.color_7766,
          )
        ],
      ),
    );
  }
}