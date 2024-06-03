import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? height, width;
  final BoxFit fit;
  final Color? color;

  const AppImage(
    this.path, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.scaleDown,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (path.contains("com.amit.thimar_app_amit63/cache")) {
      return Image.file(
        File(path),
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _errorWidget(),
        color: color,
      );
    } else if (path.endsWith("svg")) {
      return SvgPicture.asset(
        "assets/svg/$path",
        height: height,
        width: width,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      );
    } else if (path.startsWith("http")) {
      return Image.network(
        path,
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) => _errorWidget(),
        fit: fit,
        color: color,
      );
    } else if (path.endsWith("png") || path.endsWith("jpg")) {
      return Image.asset(
        "assets/images/$path",
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) => _errorWidget(),
        fit: fit,
        color: color,
      );
    }
    return _errorWidget();
  }

  Widget _errorWidget() {
    return AppImage(
      "image_failed.png",
      height: height,
      width: width,
    );
  }
}
