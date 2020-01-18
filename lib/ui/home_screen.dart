import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wan_android_flutter/model/index_banner_list.dart';
import 'package:wan_android_flutter/network/Address.dart';
import 'package:wan_android_flutter/network/DataHelper.dart';
import 'package:wan_android_flutter/network/HttpManager.dart';
import 'package:wan_android_flutter/network/ResultData.dart';
import 'package:wan_android_flutter/ui/base_widget.dart';
import 'package:wan_android_flutter/utils/route_util.dart';
import 'package:wan_android_flutter/widgets/custom_cached_image.dart';

class HomeScreen extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> attachState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends BaseWidgetState<HomeScreen> {
  // 首页轮播图数据
  List<Data> _bannerList = new List();

  // 是否显示悬浮按钮
  bool _isShowFAB = false;

  int _page = 0;

  @override
  void initState() {
    super.initState();
    setAppBarVisible(false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bannerList.add(null);

    showLoading().then((value) {
      getBannerList();
      getTopArticleList();
    });
  }

  Future getBannerList() async {
    ResultData response = await new HttpManager()
        .get(Address.INDEX_BANNER_LIST, DataHelper.getBaseMap());
    IndexBannerList indexBannerList = new IndexBannerList.fromJson(response.data);
    if (indexBannerList.data.length > 0) {
      setState(() {
        showContent().then((value) {
          _bannerList.addAll(indexBannerList.data);
        });
      });
    }
  }

  Future getTopArticleList() async {
    // TODO
  }

  @override
  AppBar attachAppBar() {
    return AppBar(title: Text(""));
  }

  @override
  Widget attachContentWidget(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: itemView,
      ),
    );
  }

  @override
  void onClickErrorWidget() {
    showLoading().then((value){
      getBannerList();
      getTopArticleList();
    });
  }

  Widget itemView(BuildContext context, int index) {
    if (index == 0) {
      return Container(
        height: 200,
        color: Colors.transparent,
        child: _buildBannerWidget(),
      );
    }
  }

  Widget _buildBannerWidget() {
    return Offstage(
      offstage: _bannerList.length == 0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          if (index >= _bannerList.length ||
          _bannerList[index] == null ||
          _bannerList[index].imagePath == null) {
            return new Container(height: 0);
          } else {
            return InkWell(
              child: new Container(
                child: CustomCachedImage(imageUrl: _bannerList[index].imagePath),
              ),
              onTap: () {
                RouteUtil.toWebView(
                  context, _bannerList[index].title, _bannerList[index].url);
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

  @override
  void dispose() {
    super.dispose();
  }
}