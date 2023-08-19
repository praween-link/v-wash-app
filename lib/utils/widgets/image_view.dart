import 'package:appwash/utils/images/icons_path.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView {
  static Widget view(String url,
          {double? height, double? width, BoxFit? fit}) =>
      Container(
        color: Colors.grey.withOpacity(0.2),
        child: CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, _) => const Center(
                child: Wrap(children: [CircularProgressIndicator()])),
            errorWidget: (context, _, error) => const Icon(Icons.error),
            height: height,
            width: width,
            fit: fit),
      );

  static Widget assetView(String path,
      {double? height, double? width, BoxFit? fit}) {
    return Container(
        color: Colors.transparent,
        child: Image.asset(path,
            height: height, width: width, fit: fit));
  }
}
