import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

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
    // final FullContact contact = (await FlutterContactPicker.pickFullContact());
    // print(contact);
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
          child: ListView.builder(
            itemCount: dataList.length+1,
              itemBuilder: (BuildContext context,int index){
              if (index == 0) {
                return Container(

                );
              }
              return Container();
              }),
        ),
      ),
    );
  }
}