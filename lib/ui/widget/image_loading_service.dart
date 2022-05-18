import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoadingService extends StatelessWidget {
  const ImageLoadingService({
    Key? key,
    required this.url,
    this.borderRadius,
  }) : super(key: key);
  final String url;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final Widget image = CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
    );
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: image,
      );
    } else {
      return image;
    }
  }
}
