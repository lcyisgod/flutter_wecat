import 'package:flutter/material.dart';
import 'package:flutter_weicat/common/res/resources.dart';
import 'package:flutter_weicat/login/view/discover_url_iten.dart';
import 'package:flutter_weicat/login/view/disover_item.dart';

class ContactsItem extends StatefulWidget {
  final Map dataMpa;
  /*
   * 0:其他标签
   * 1:联系人信息
   */
  final Function(int type,Map<String,dynamic> map) onPressed;

  const ContactsItem({Key key, @required this.dataMpa,this.onPressed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsItemState();
  }
}

class ContactsItemState extends State<ContactsItem> {

  bool haveHeader;
  List dataList;
  double heightItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.dataMpa['name'].toString().isEmpty) {
      haveHeader = false;
    }else {
      haveHeader = true;
    }

    dataList = widget.dataMpa['data'] as List;

    if (haveHeader) {
      heightItem = 30.0+55.0*dataList.length;
    }else {
      heightItem = 55.0*dataList.length;
    }
  }

  Widget _buildContactsItem(BuildContext context,int index) {
    if(haveHeader) {
      if (index == 0) {
        return Container(
          height: 30,
          alignment: Alignment(-1,0),
          padding: EdgeInsets.only(
            left: 16,
            right: 16
          ),
          child: Text(
            '${widget.dataMpa['title']}',
            style: TextStyles.textMain18Body,
          ),
        );
      }else {
        Map map = dataList[index-1];
        return InkWell(
          onTap: (){
            widget.onPressed(1,{'userId':map['userId']});
          },
          child: DisoverUrlItem(
            dataMap: map,
            hideArrow: true,
          ),
        );
      }
    }else {
      Map map = dataList[index];
      return InkWell(
        onTap: (){
          widget.onPressed(0,{'title':map['name']});
        },
        child: DisoverItem(
            dataMap: map,
            hideArrow: true
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: heightItem,
      child: ListView.builder(
          itemCount: haveHeader?dataList.length+1:dataList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context,int index){
            return _buildContactsItem(context, index);
          }),
    );
  }
}