import 'package:app/core/logic/responsive.dart';
import 'package:app/views/test_responsive/platforms/mobile.dart';
import 'package:app/views/test_responsive/platforms/tablet.dart';
import 'package:app/views/test_responsive/platforms/web.dart';
import 'package:flutter/material.dart';

class TestResponsiveView extends StatelessWidget {
  const TestResponsiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: TestResponsiveMobileView(),
      tablet: TestResponsiveTabletView(),
      web: TestResponsiveWebView(),
    );
  }
}

// mobile
// tablet
// web
