import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MgViewImageNetwork extends StatelessWidget {
  final double _height;
  final double _width;
  final String? _element;

  const MgViewImageNetwork({
    Key? key,
    String? element,
    required double height,
    required double width,
  })  : _height = height,
        _width = width,
        _element = element,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: CachedNetworkImage(
        imageUrl: _element!,
        imageBuilder: (context, imageProvider) => Container(
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
      ),
    );
  }
}
