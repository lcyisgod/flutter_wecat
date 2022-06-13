import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  static const platform = const MethodChannel('samples.flutter.io/getContacts');
  Map datMap = {
    'msg':'无数据',
    'data':[]
  };

  Future<void> _getContactsPhone() async{
    Map resultData;
    // Stream<Contact> contacts = await Contacts.streamContacts();
    // try{
    //   resultData = await platform.invokeMethod('getPhoneContacts');
    // } on PlatformException catch(e) {
    //   resultData = {
    //     'msg':'${e.message}',
    //     'data':[]
    //   };
    // }
    setState(() {
      datMap = resultData;
    });
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