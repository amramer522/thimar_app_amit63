import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaveAccountOrNot extends StatelessWidget {
  final bool fromRegister;

  const HaveAccountOrNot({super.key, this.fromRegister = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 48.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              fromRegister ? "haveAccount".tr() : "dontHaveAccount".tr(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                fromRegister ? "login".tr() : "register".tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
