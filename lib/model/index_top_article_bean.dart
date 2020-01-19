import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/model/index_article_bean.dart';

part 'index_top_article_bean.g.dart';

@JsonSerializable()
class IndexTopArticleBean extends Object {

  @JsonKey(name: 'data')
  List<IndexArticleData> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  IndexTopArticleBean(this.data,this.errorCode,this.errorMsg,);

  factory IndexTopArticleBean.fromJson(Map<String, dynamic> srcJson) => _$IndexTopArticleBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndexTopArticleBeanToJson(this);

}