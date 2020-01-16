import 'package:json_annotation/json_annotation.dart'; 
  
part 'index_banner_list.g.dart';


@JsonSerializable()
  class IndexBannerList extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  IndexBannerList(this.data,this.errorCode,this.errorMsg,);

  factory IndexBannerList.fromJson(Map<String, dynamic> srcJson) => _$IndexBannerListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndexBannerListToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

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

  Data(this.desc,this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
