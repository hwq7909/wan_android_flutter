import 'package:json_annotation/json_annotation.dart';

part 'index_article_bean.g.dart';


@JsonSerializable()
class IndexArticleBean extends Object {

  @JsonKey(name: 'data')
  IndexArticleList data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  IndexArticleBean(this.data,this.errorCode,this.errorMsg,);

  factory IndexArticleBean.fromJson(Map<String, dynamic> srcJson) => _$IndexArticleBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndexArticleBeanToJson(this);

}


@JsonSerializable()
class IndexArticleList extends Object {

  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<IndexArticleData> datas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  IndexArticleList(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory IndexArticleList.fromJson(Map<String, dynamic> srcJson) => _$IndexArticleListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndexArticleListToJson(this);

}


@JsonSerializable()
class IndexArticleData extends Object {

  @JsonKey(name: 'apkLink')
  String apkLink;

  @JsonKey(name: 'audit')
  int audit;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'chapterId')
  int chapterId;

  @JsonKey(name: 'chapterName')
  String chapterName;

  @JsonKey(name: 'collect')
  bool collect;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'envelopePic')
  String envelopePic;

  @JsonKey(name: 'fresh')
  bool fresh;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'niceShareDate')
  String niceShareDate;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'prefix')
  String prefix;

  @JsonKey(name: 'projectLink')
  String projectLink;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'selfVisible')
  int selfVisible;

  @JsonKey(name: 'shareDate')
  int shareDate;

  @JsonKey(name: 'shareUser')
  String shareUser;

  @JsonKey(name: 'superChapterId')
  int superChapterId;

  @JsonKey(name: 'superChapterName')
  String superChapterName;

  @JsonKey(name: 'tags')
  List<IndexArticleTags> tags;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'visible')
  int visible;

  @JsonKey(name: 'zan')
  int zan;

  @JsonKey(name: 'top')
  bool top;

  IndexArticleData(this.apkLink,this.audit,this.author,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.envelopePic,this.fresh,this.id,this.link,this.niceDate,this.niceShareDate,this.origin,this.prefix,this.projectLink,this.publishTime,this.selfVisible,this.shareDate,this.shareUser,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,this.top,);

  factory IndexArticleData.fromJson(Map<String, dynamic> srcJson) => _$IndexArticleDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndexArticleDataToJson(this);

}


@JsonSerializable()
class IndexArticleTags extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  IndexArticleTags(this.name,this.url,);

  factory IndexArticleTags.fromJson(Map<String, dynamic> srcJson) => _$IndexArticleTagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndexArticleTagsToJson(this);

}


