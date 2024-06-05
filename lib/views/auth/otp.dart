import 'package:app/core/app_theme.dart';
import 'package:app/features/login/bloc.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/design/app_button.dart';
import '../../core/design/app_image.dart';
import '../../core/design/app_input.dart';
import '../../core/logic/input_validator.dart';
import '../../features/otp/bloc.dart';
import 'components/have_account_or_not.dart';

class OTPView extends StatefulWidget {
  final String phone;
  const OTPView({super.key, required this.phone});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final bloc = GetIt.instance<OTPBloc>();
  bool isTimerFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: bloc.formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppImage(
                  "logo.png",
                  width: 130.w,
                  height: 125.h,
                ),
                SizedBox(height: 16.h),
                Text(
                  "تفعيل الحساب",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text.rich(TextSpan(
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppTheme.grey,
                    ),
                    children: [
                      TextSpan(text: "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال"),
                      TextSpan(text: "\t"),
                      WidgetSpan(
                        child: Text(
                          "+${widget.phone}",
                          textDirection: mat.TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppTheme.grey,
                          ),
                        ),
                      ),
                      TextSpan(text: "\t"),
                      TextSpan(
                        text: "تغيير رقم الجوال",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    ])),
                SizedBox(height: 24.h),
                PinCodeTextField(
                  appContext: context,
                  controller: bloc.codeController,
                  errorTextDirection: mat.TextDirection.rtl,
                  validator: (value) {
                    if(value!.isEmpty)
                      {
                        return "يجب ادخال كود التأكيد";
                      }
                    return null;
                  },
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    fieldHeight: 60.h,
                    shape: PinCodeFieldShape.box,
                    inactiveFillColor: Colors.transparent,
                    activeFillColor: Colors.transparent,
                    selectedFillColor: Colors.transparent,
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: AppTheme.border,
                    selectedColor: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16.r),
                    fieldWidth: 70.w,
                  ),
                  length: 4,
                ),
                SizedBox(height: 16.h),
                BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) => AppButton(
                          isLoading: state is VerifyOTPLoadingState,
                          onPressed: () {
                            bloc.add(VerifyOTPEvent(phone: widget.phone));
                          },
                          text: "تأكيد الكود",
                        )),
                SizedBox(height: 32.h),
                Text(
                  "لم تستلم الكود ؟\nيمكنك إعادة إرسال الكود بعد",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppTheme.grey,
                  ),
                ),
                SizedBox(height: 32.h),
                if (!isTimerFinished)
                  CircularCountDownTimer(
                    width: 70.h,
                    height: 70.h,
                    duration: 140,
                    onComplete: () {
                      isTimerFinished = true;
                      setState(() {});
                    },
                    textStyle: TextStyle(fontSize: 24.sp, color: Theme.of(context).primaryColor),
                    textFormat: CountdownTextFormat.MM_SS,
                    isReverse: true,
                    fillColor: AppTheme.border,
                    ringColor: Theme.of(context).primaryColor,
                  ),
                SizedBox(height: 16.h),
                Center(
                  child: OutlinedButton(
                    onPressed: isTimerFinished
                        ? () {
                            isTimerFinished = false;
                            setState(() {});
                          }
                        : null,
                    style: isTimerFinished
                        ? OutlinedButton.styleFrom(
                            side: BorderSide(color: Theme.of(context).primaryColor))
                        : null,
                    child: Text("إعادة الإرسال"),
                  ),
                ),
                HaveAccountOrNot(
                  fromRegister: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
