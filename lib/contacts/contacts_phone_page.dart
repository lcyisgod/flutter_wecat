import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_wecat/contacts/view/contacts_phone_view.dart';

class ContactsPhonePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsPhonePageState();
  }
}

class ContactsPhonePageState extends State<ContactsPhonePage> {

  List dataList;

  Future<void> _getContactsPhone() async{
    if(await FlutterContacts.requestPermission()) {
      List<Contact> contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      if(contacts.isEmpty) {
        return;
      }
      setState(() {
        dataList = contacts;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList = [];
    _getContactsPhone();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '通讯录朋友',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ContactsPhoneView(
            dataList: dataList,
          ),
        ),
      ),
    );
  }
}