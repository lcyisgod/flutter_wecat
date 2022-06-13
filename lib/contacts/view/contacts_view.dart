import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/contacts/widget/contacts_item.dart';
import 'package:oktoast/oktoast.dart';

class ContactsView extends StatefulWidget {
  final List dataList;
  final List searchDataList;
  /*
  * 0:搜索
  * 1:点击标签
  * 2:查看联系人信息*/
  final Function(int type,Map<String,dynamic> map) onPressed;

  const ContactsView({Key key, this.dataList, this.searchDataList,this.onPressed}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsViewState();
  }
}

class ContactsViewState extends State<ContactsView> {
  ScrollController _controller;
  bool _showTopHeader;
  List<Map> dataHeaderInfo;
  String _headerTitle;
  int _currentSearchIndex;

  //跳转对应的header
  Future<void> _jumpToActionTitle(String title) async {
    showToast(title);
    if (title == '🔍') {
      _controller.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
    }else {
      //循环遍历headerInfo,找到对应位置
      for (int i = 0; i < dataHeaderInfo.length; i ++) {
        Map dataMap = dataHeaderInfo[i];
        if (title == dataMap['title']) {
          double minHeight = dataMap['minHeight']+331;
          _controller.animateTo(minHeight, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
          break;
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _showTopHeader = false;
    _headerTitle = '';
    dataHeaderInfo = [];
    _currentSearchIndex = 0;
    ///遍历数组获取每个header的位置信息
    if (widget.dataList.length >= 2) {
      double minHeight = 0.0;
      double maxHeight = 0.0;
      for(int i = 1; i < widget.dataList.length; i++) {
        Map dataMap = widget.dataList[i];
        minHeight = maxHeight;
        List friendList = dataMap['data'] as List;
        maxHeight = maxHeight + friendList.length * 55;
        Map headerInfoMap = {
          'title':dataMap['title'],
          'minHeight':minHeight,
          'maxHeight':maxHeight
        };
        dataHeaderInfo.add(headerInfoMap);
      }
    }
    _controller.addListener(() {
      double offset = _controller.offset - 330;
      if (offset >= 0.0) {
        if (!_showTopHeader) {
          if (_currentSearchIndex == 0) {
            setState(() {
              _showTopHeader = true;
            });
          }else {
            setState(() {
              _currentSearchIndex = 0;
              _showTopHeader = true;
            });
          }
        }
      }else {
        if(_showTopHeader) {
          setState(() {
            _currentSearchIndex = 0;
            _showTopHeader = false;
          });
        }
        return;
      }

      //遍历header数组获取当前显示的header内容
      for (int i =0; i < dataHeaderInfo.length;  i++) {
        Map headInfoMap = dataHeaderInfo[i];
        if (headInfoMap['minHeight'] <= offset && headInfoMap['maxHeight'] >=offset) {
         if(_headerTitle != headInfoMap['name']) {
           setState(() {
             _currentSearchIndex = i+1;
             _headerTitle = headInfoMap['name'] as String;
           });
         }
          break;
        }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: [
          Container(
            color:Colours.bg_color,
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: ListView.builder(
                itemCount: widget.dataList.length+1,
                controller: _controller,
                itemBuilder: (BuildContext context,int index){
                  if (index == 0) {
                    return InkWell(
                      onTap: (){
                        //搜索
                        widget.onPressed(0,null);
                      },
                      child: Container(
                        color: Colours.bg_color,
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 10
                        ),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search_rounded),
                              Text(
                                '搜索',
                                style: TextStyles.text6ca516,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }else {
                    Map dataMap = widget.dataList[index-1];
                    return ContactsItem(
                      dataMpa: dataMap,
                      onPressed: (int type,dynamic data) {
                        int clickType = type == 0 ? 1:2;
                        widget.onPressed(clickType,data);
                      },
                    );
                  }
                }),
          ),
          Positioned(
            child: Offstage(
              offstage: !_showTopHeader,
              child: Container(
                height: 45,
                color: Colors.white,
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16
                ),
                alignment: Alignment(-1,0),
                child: Text(
                    _headerTitle == null?'':_headerTitle
                ),
              ),
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 200,
              width: 20,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.searchDataList.length,
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(
                      onTap: (){
                        _jumpToActionTitle(widget.searchDataList[index]);
                      },
                      child: Text(
                        widget.searchDataList[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: _currentSearchIndex == index?Colors.blue:Colors.black
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}