import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/widgets/progress_view.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  CustomCachedImage({Key key, @required this.imageUrl, this.fit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? CachedNetworkImage(
            fit: fit,
            imageUrl: imageUrl,
            placeholder: (context, url) => new ProgressView(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          )
        : Container();
  }
}
