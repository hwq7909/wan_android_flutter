import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wan_android_flutter/model/index_banner_bean.dart';
import 'package:wan_android_flutter/network/Address.dart';
import 'package:wan_android_flutter/network/DataHelper.dart';
import 'package:wan_android_flutter/network/HttpManager.dart';
import 'package:wan_android_flutter/network/ResultData.dart';
import 'package:wan_android_flutter/utils/route_util.dart';
import 'package:wan_android_flutter/widgets/custom_cached_image.dart';

class HomeBannerScreen  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeBannerState();
  }
}

class HomeBannerState extends State<HomeBannerScreen> {
  List<IndexBannerData> _bannerList = new List();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _bannerList.add(null);
    _getBannerList();
  }

  Future _getBannerList() async {
    ResultData resultData = new HttpManager()
        .get(Address.INDEX_BANNER_LIST, DataHelper.getBaseMap());
    IndexBannerBean indexBannerBean = IndexBannerBean.fromJson(resultData.data);
    if (indexBannerBean.data.length > 0) {
      setState(() {
        _bannerList.addAll(indexBannerBean.data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: _bannerList.length == 0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          if (index >= _bannerList.length ||
            _bannerList[index] == null ||
            _bannerList[index].imagePath == null) {
            return new Container(height: 0);
          } else{
            return InkWell(
              child: new Container(
                child: CustomCachedImage(
                  imageUrl: _bannerList[index].imagePath
                ),
              ),
              onTap: () {
                RouteUtil.toWebView(
                  context, _bannerList[index].title, _bannerList[index].url
                );
              },
            );
          }
        },
        itemCount: _bannerList.length,
        autoplay: true,
        pagination: new SwiperPagination(),
      ),
    );
  }
}