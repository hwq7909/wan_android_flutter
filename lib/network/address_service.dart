import 'package:dio/dio.dart';
import 'package:wan_android_flutter/network/Address.dart';
import 'package:wan_android_flutter/network/DataHelper.dart';
import 'package:wan_android_flutter/network/HttpManager.dart';
import 'package:wan_android_flutter/network/ResultData.dart';

class AddressService {
  Dio _dio;
  static AddressService _instance = AddressService._internal();

  factory AddressService() => _instance;

  AddressService._internal(){
    if (null == _dio) {
      new HttpManager();
    }
  }
  // 首页文章数据列表
  getArticleList(int _page) async {
    return new HttpManager().get(Address.INDEX_ARTICLE_LIST + "/$_page/json", DataHelper.getBaseMap());
  }
}
