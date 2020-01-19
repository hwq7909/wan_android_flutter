import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/model/index_article_bean.dart';
import 'package:wan_android_flutter/utils/route_util.dart';
import 'package:wan_android_flutter/widgets/custom_cached_image.dart';
import 'package:wan_android_flutter/widgets/like_button_widget.dart';

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
                  offstage: item.top == false,
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
                    child: Text(
                      "置顶",
                      style: TextStyle(
                          fontSize: 10, color: const Color(0xFFF44336)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Offstage(
                  offstage: !item.fresh,
                  child: Container(
                    decoration: new BoxDecoration(
                      border:
                      new Border.all(color: Color(0xFFF44336), width: 0.5),
                      borderRadius: new BorderRadius.vertical(
                          top: Radius.elliptical(2, 2),
                          bottom: Radius.elliptical(2, 2)),
                    ),
                    padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                    margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: Text(
                      "新",
                      style: TextStyle(
                          fontSize: 10, color: const Color(0xFFF44336)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Offstage(
                  offstage: item.tags.length == 0,
                  child: Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.cyan, width: 0.5),
                      borderRadius: new BorderRadius.vertical(
                          top: Radius.elliptical(2, 2),
                          bottom: Radius.elliptical(2, 2)),
                    ),
                    padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                    margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: Text(
                      item.tags.length > 0 ? item.tags[0].name : "",
                      style: TextStyle(fontSize: 10, color: Colors.cyan),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Text(
                  item.author.isNotEmpty ? item.author : item.shareUser,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  textAlign: TextAlign.left,
                ),
                Expanded(
                  child: Text(
                    item.niceDate,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Offstage(
                  offstage: item.envelopePic == "",
                  child: Container(
                      width: 100,
                      height: 80,
                      padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                      child: CustomCachedImage(imageUrl: item.envelopePic)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Text(
                          item.title,
                          maxLines: 2,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                item.superChapterName +
                                    " / " +
                                    item.chapterName,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            LikeButtonWidget(
                              isLike: item.collect,
                              onClick: () {
//                                addOrCancelCollect(item);
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1)
        ],
      ),
    );
  }
}