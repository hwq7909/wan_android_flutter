import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/model/index_article_bean.dart';
import 'package:wan_android_flutter/utils/route_util.dart';

class ItemArticleList extends StatefulWidget {
  IndexArticleData item;

  ItemArticleList({this.item});

  @override
  State createState() {
    return new ItemArticleListState();
  }
}

class ItemArticleListState extends State<ItemArticleList> {

  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return InkWell(
      onTap: () {
        RouteUtil.toWebView(context, item.title, item.link);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Offstage(
                  offstage: true,
                  child: Container(
                    decoration: new BoxDecoration(
                      border:
                      new Border.all(color: Color(0xFFF44336), width: 0.5),
                      borderRadius: new BorderRadius.vertical(
                        top: Radius.elliptical(2, 2),
                        bottom: Radius.elliptical(2, 2),),
                    ),
                    padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                    margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                  ),
                ),
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}