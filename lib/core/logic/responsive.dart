import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile, tablet, web;

  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.web});

  static bool isWeb(context) => MediaQuery.of(context).size.width > 1100;

  static bool isTablet(context) =>
      MediaQuery.of(context).size.width > 650 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isMobile(context) => MediaQuery.of(context).size.width < 650;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1100) {
          return web;
        } else if (constraints.maxWidth > 650) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
