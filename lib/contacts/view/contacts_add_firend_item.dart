import 'package:flutter/material.dart';

import '../../common/res/colors.dart';
import '../../common/widget/distance_widget.dart';

class ContactsAddFriendItem extends StatelessWidget {
  final imageUrl;
  final title;
  final detailTitle;
  const ContactsAddFriendItem({Key? key,this.imageUrl,this.title,this.detailTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(left: 5.0,right: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      this.imageUrl,
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment(-1,0),
                                      child: Text(
                                        this.title,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment(-1,0),
                                      child: Text(
                                        this.detailTitle,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 9
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                          Icons.chevron_right_rounded,
                          size: 20,
                        )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: DistanceWidget(
              height: 0.25,
              color: Colours.color_7766,
            ),
          )
        ],
      ),
    );
  }
}