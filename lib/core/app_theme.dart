import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const primary = Color(0xff4C8613);
  static const grey = Color(0xff707070);
  static const border = Color(0xffF3F3F3);

  static ThemeData get light => ThemeData(
        fontFamily: "Tajawal",
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.resolveWith(
            (states) {
              if (!states.contains(MaterialState.selected)) {
                return Color(0xffC0C0C0);
              }
              return primary;
            },
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primary,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white.withOpacity(.3),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        )),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            disabledBackgroundColor: primary.withOpacity(.2),
            fixedSize: Size.fromHeight(60.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 16.sp, color: grey),
          labelStyle: TextStyle(fontSize: 16.sp, color: grey),
          alignLabelWithHint: true,
          floatingLabelStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: primary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: border),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(primary.value, {
            50: primary.withOpacity(.1),
            100: primary.withOpacity(.2),
            200: primary.withOpacity(.3),
            300: primary.withOpacity(.4),
            400: primary.withOpacity(.5),
            500: primary.withOpacity(.6),
            600: primary.withOpacity(.7),
            700: primary.withOpacity(.8),
            800: primary.withOpacity(.9),
            900: primary,
          }),
          backgroundColor: Colors.white,
        ),
      );
}
