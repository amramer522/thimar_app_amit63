import 'package:app/core/app_theme.dart';
import 'package:app/views/test_firebase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/logic/cache_helper.dart';
import 'core/logic/helper_methods.dart';
import 'features/service_locator.dart';
import 'firebase_options.dart';
import 'views/auth/login.dart';
import 'views/auth/otp.dart';
import 'views/auth/register.dart';
import 'views/home/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  initServiceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
    supportedLocales: const [Locale("en"), Locale("ar"),],
    path: "assets/translations",
    fallbackLocale: const Locale("en"),
    startLocale: const Locale("ar"),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: TestFirebaseView(),
      builder: (context, child) => MaterialApp(
        title: 'Thimar',
        theme: AppTheme.light,
        navigatorKey: navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: child,
      ),
    );
  }
}
