import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/model/index_article_bean.dart';
import 'package:wan_android_flutter/model/index_banner_bean.dart';
import 'package:wan_android_flutter/model/index_top_article_bean.dart';
import 'package:wan_android_flutter/network/Address.dart';
import 'package:wan_android_flutter/network/DataHelper.dart';
import 'package:wan_android_flutter/network/HttpManager.dart';
import 'package:wan_android_flutter/network/ResultData.dart';
import 'package:wan_android_flutter/network/address_service.dart';
import 'package:wan_android_flutter/ui/base_widget.dart';
import 'package:wan_android_flutter/utils/route_util.dart';
import 'package:wan_android_flutter/widgets/custom_cached_image.dart';
import 'package:wan_android_flutter/widgets/item_article_list.dart';
import 'package:wan_android_flutter/widgets/refresh_helper.dart';

class HomeScreen extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> attachState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends BaseWidgetState<HomeScreen> {
  // 首页轮播图数据
  List<IndexBannerData> _bannerList = new List();

  // 首页文章列表数据
  List<IndexArticleData> _articleList = new List();

  // listView控制器
  ScrollController _scrollController = new ScrollController();

  // 是否显示悬浮按钮
  bool _isShowFAB = false;

  // 页码 0开始
  int _page = 0;

  RefreshController _refreshController =
      new RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    setAppBarVisible(false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
//    _bannerList.add(null);

    showLoading().then((value) {
      getBannerList();
      getTopArticleList();
//      getArticleList();
    });

    _scrollController.addListener(() {
      // 滑动到底部，加载更多
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // getMoreArticleList();
      }
      if (_scrollController.offset < 200 && _isShowFAB) {
        setState(() {
          _isShowFAB = false;
        });
      } else if (_scrollController.offset >= 200 && !_isShowFAB) {
        _isShowFAB = true;
      }
    });
  }

  Future getBannerList() async {
    ResultData resultData = await new HttpManager()
        .get(Address.INDEX_BANNER_LIST, DataHelper.getBaseMap());
    IndexBannerBean indexBannerBean =
        new IndexBannerBean.fromJson(resultData.data);
    if (indexBannerBean.data.length > 0) {
      setState(() {
        _bannerList.addAll(indexBannerBean.data);
      });
    }
  }

  Future getTopArticleList() async {
    ResultData resultData = await new HttpManager()
        .get(Address.INDEX_TOP_ARTICLE_LIST, DataHelper.getBaseMap());
    IndexTopArticleBean indexTopArticleBean =
        new IndexTopArticleBean.fromJson(resultData.data);
    if (indexTopArticleBean.data.length > 0) {
      indexTopArticleBean.data.forEach((v) {
        v.top = true;
      });
      _articleList.clear();
      _articleList.addAll(indexTopArticleBean.data);
    }
    getArticleList();
  }

  Future getArticleList() async {
    _page = 0;
    ResultData resultData = await new AddressService().getArticleList(_page);
    IndexArticleBean indexArticleBean = new IndexArticleBean.fromJson(resultData.data);
    if (indexArticleBean.data.datas.length > 0) {
      showContent().then((value) {
        _refreshController.refreshCompleted(resetFooterState: true);
        setState(() {
          _articleList.addAll(indexArticleBean.data.datas);
        });
      });
    }
  }

  Future getMoreArticleList() async {
    _page++;
    ResultData resultData = await new AddressService().getArticleList(_page);
    IndexArticleBean indexArticleBean = new IndexArticleBean.fromJson(resultData.data);
    if (indexArticleBean.data.datas.length > 0) {
      showContent().then((value) {
        _refreshController.refreshCompleted(resetFooterState: true);
        setState(() {
          _articleList.addAll(indexArticleBean.data.datas);
        });
      });
    }
  }

  @override
  AppBar attachAppBar() {
    return AppBar(title: Text(""));
  }

  @override
  Widget attachContentWidget(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: MaterialClassicHeader(),
        footer: RefreshFooter(),
        controller: _refreshController,
        onRefresh: getTopArticleList,
        onLoading: getMoreArticleList,
        child: ListView.builder(
          itemBuilder: itemView,
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: _articleList.length + 1,
        ),
      ),
      floatingActionButton: !_isShowFAB
          ? null
          : FloatingActionButton(
              heroTag: "home",
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 2000), curve: Curves.ease);
              },
            ),
    );
  }

  @override
  void onClickErrorWidget() {
    showLoading().then((value) {
      getBannerList();
      getTopArticleList();
//      getArticleList();
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
    IndexArticleData item = _articleList[index - 1];
    return ItemArticleList(item: item);
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
                child:
                    CustomCachedImage(imageUrl: _bannerList[index].imagePath),
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
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
