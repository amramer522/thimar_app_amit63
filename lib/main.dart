import 'package:app/core/app_theme.dart';
import 'package:app/core/logic/bloc_ovserver.dart';
import 'package:app/core/logic/firebase_helper.dart';
import 'package:app/core/logic/my_fatwora_helper.dart';
import 'package:app/views/products/add_product.dart';
import 'package:app/views/test_firebase.dart';
import 'package:app/views/test_responsive/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'amr/pages/home.dart';
import 'core/logic/cache_helper.dart';
import 'core/logic/helper_methods.dart';
import 'core/logic/sql_helper.dart';
import 'features/service_locator.dart';
import 'firebase_options.dart';
import 'views/chat/view.dart';
import 'views/data2.dart';
import 'views/pay/view.dart';
import 'views/pay2.dart';
import 'views/products/view.dart';
import 'views/search.dart';
import 'views/text_to_image.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await SqlHelper.open();
  await EasyLocalization.ensureInitialized();
  initServiceLocator();
  Bloc.observer = AppBlocObserver();
  // await MyFatworaHelper.init();
// await FirebaseHelper().init();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en"),
        Locale("ar"),
      ],
      path: "assets/translations",
      fallbackLocale: const Locale("en"),
      startLocale: const Locale("en"),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: ProductsView(),
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
