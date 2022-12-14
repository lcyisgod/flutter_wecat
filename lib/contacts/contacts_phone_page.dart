import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_wecat/common/widget/distance_widget.dart';

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
    'data':[]
  };

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
          child: ListView.builder(
            itemCount: dataList.length,
              itemBuilder: (BuildContext context,int index){
              final Contact contact = dataList[index];
                return Container(
                  child: Column(
                    children: [
                      Container(
                        height: 20,
                        child: Text(
                            contact.displayName
                        ),
                      ),
                      Container(
                        height: 20,
                        child: Text(
                            '${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'
                        ),
                      ),
                      DistanceWidget(
                        height: 1,
                        color: Colors.deepOrange,
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}