import 'package:wan_android_flutter/network/Address.dart';
import 'package:wan_android_flutter/network/DataHelper.dart';
import 'package:wan_android_flutter/network/HttpManager.dart';

class Api {
  static request(String param) {
    var params = DataHelper.getBaseMap();
    params['param'] = param;
    return HttpManager.getInstance().get(Address.INDEX_BANNER_LIST, params);
  }
}