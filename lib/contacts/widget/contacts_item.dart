import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/login/widget/discover_url_iten.dart';
import 'package:flutter_wecat/login/widget/disover_item.dart';
import 'package:flutter_wecat/contacts/models/contacts_person_model.dart';

class ContactsItem extends StatefulWidget {
  final Map dataMpa;
  /*
   * 0:其他标签
   * 1:联系人信息
   */
  final Function(int type,Map<String,dynamic>? map)? onPressed;

  const ContactsItem({Key? key,  required this.dataMpa,this.onPressed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ContactsItemState();
  }
}

class ContactsItemState extends State<ContactsItem> {

  late bool haveHeader;
  late List dataList;
  late double heightItem;

  @override
  void initState() {
    super.initState();
    if (widget.dataMpa['title'].toString().isEmpty) {
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
        ContactsPersonModel contactsPersonModel = dataList[index-1] as ContactsPersonModel;
        return InkWell(
          onTap: (){
            widget.onPressed?.call(1,{'userId':contactsPersonModel.userId});
          },
          child: DisoverUrlItem(
            imageUrl: contactsPersonModel.image??'',
            title: contactsPersonModel.name??'',
            hideArrow: true,
          ),
        );
      }
    }else {
      ContactsPersonModel contactsPersonModel = dataList[index] as ContactsPersonModel;
      return InkWell(
        onTap: (){
          widget.onPressed?.call(0,{'title':contactsPersonModel.name});
        },
        child: DisoverItem(
            imageUrl: contactsPersonModel.image??'',
            title: contactsPersonModel.name??'',
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