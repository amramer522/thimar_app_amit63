import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:app/core/app_theme.dart';
import 'package:app/core/design/app_image.dart';
import 'package:app/views/home/pages/favorites/view.dart';
import 'package:app/views/home/pages/home/view.dart';
import 'package:app/views/home/pages/my_account/view.dart';
import 'package:app/views/home/pages/my_orders/view.dart';
import 'package:app/views/home/pages/notifications/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _pageController = PageController(initialPage: 2);
  final icons = [
    "my_orders.svg",
    "notifications.svg",
    "home.svg",
    "favorites.svg",
    "my_account.svg"
  ];
  final titles = ["طلباتي", "الإشعارات", "الرئيسية", "المفضلة", "حسابي"];
  int currentPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Theme(
        data: ThemeData().copyWith(useMaterial3: false),
        child: FloatingActionButton(
          backgroundColor: AppTheme.primary,
          onPressed: () {
            _pageController.jumpToPage(2);
          },
          child: AppImage(icons[2]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppTheme.primary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          children: List.generate(
            5,
            (index) => index == 2
                ? Spacer()
                : Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _pageController.jumpToPage(index);
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppImage(
                              icons[index],
                              color: currentPage == index ? Colors.white : Colors.grey[400],
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              titles[index],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: currentPage == index ? Colors.white : Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          currentPage = value;
          setState(() {});
        },
        children: [
          MyOrdersPage(),
          NotificationsPage(),
          HomePage(),
          FavoritesPage(),
          MyAccountPage()
        ],
      ),
    );
  }
}
