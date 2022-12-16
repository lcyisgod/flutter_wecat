import 'package:flutter/material.dart';

import '../../common/widget/distance_widget.dart';

class ContactsAddFriendItem extends StatelessWidget {
  final imageUrl;
  final title;
  final detailTitle;
  const ContactsAddFriendItem({Key key,this.imageUrl,this.title,this.detailTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 45,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(left: 5.0,right: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                    this.imageUrl,
                    height: 20,
                    width: 20
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              this.title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              this.detailTitle,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 9
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Container(
              height: 1.0,
              color: Colors.lightBlue,
            ),
          )
        ],
      ),
    );
  }
}