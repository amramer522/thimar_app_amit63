import 'package:app/core/logic/responsive.dart';
import 'package:app/views/test_responsive/components/my_app_bar/mobile.dart';
import 'package:app/views/test_responsive/components/my_app_bar/tablet.dart';
import 'package:app/views/test_responsive/components/my_app_bar/web.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MyAppBarMobile(),
      tablet: MyAppBarTablet(),
      web: MyAppBarWeb(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
