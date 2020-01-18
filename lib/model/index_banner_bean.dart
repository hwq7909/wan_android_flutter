import 'package:json_annotation/json_annotation.dart';

part 'index_banner_bean.g.dart';


@JsonSerializable()
class IndexBannerBean extends Object {

  @JsonKey(name: 'data')
  List<IndexBannerData> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  IndexBannerBean(this.data,this.errorCode,this.errorMsg,);

  factory IndexBannerBean.fromJson(Map<String, dynamic> srcJson) => _$IndexBannerBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndexBannerBeanToJson(this);

}


@JsonSerializable()
class IndexBannerData extends Object {

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'imagePath')
  String imagePath;

  @JsonKey(name: 'isVisible')
  int isVisible;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'url')
  String url;

  IndexBannerData(this.desc,this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url,);

  factory IndexBannerData.fromJson(Map<String, dynamic> srcJson) => _$IndexBannerDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndexBannerDataToJson(this);

}


