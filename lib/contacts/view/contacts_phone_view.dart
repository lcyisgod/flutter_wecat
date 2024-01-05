import 'package:flutter/material.dart';

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_wecat/contacts/widget/contacts_phone_info_item.dart';

class ContactsPhoneView extends StatefulWidget {

  final List? dataList;

  const ContactsPhoneView({Key? key, this.dataList}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ContactsPhoneViewState();
  }
}

class ContactsPhoneViewState extends State<ContactsPhoneView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: widget.dataList?.length,
          itemBuilder: (BuildContext context,int index){
            final Contact contact = widget.dataList?[index];
            return ContactsPhoneInfoItem(
              contact: contact,
              isFriend: index % 3 == 0,
            );
          }),
    );
  }
}