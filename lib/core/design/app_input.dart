import 'package:app/core/app_theme.dart';
import 'package:app/core/design/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum InputType { normal, phone, password }

class AppInput extends StatefulWidget {
  final String label;
  final InputType inputType;
  final String? hint, prefixIcon;
  final bool isMultiLine;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const AppInput({
    super.key,
    required this.label,
    this.keyboardType,
    this.hint,
    this.isMultiLine = false,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.inputType = InputType.normal,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: IntrinsicHeight(
        child: TextFormField(
          controller: widget.controller,
          obscureText: isHidden && widget.inputType == InputType.password,
          keyboardType: widget.keyboardType,
          maxLines: widget.isMultiLine ? 3 : 1,
          validator: widget.validator,
          decoration: InputDecoration(
              labelText: widget.label,
              icon: widget.inputType == InputType.phone
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.border),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: AppImage(
                              "saudi.png",
                              width: 32.w,
                              height: 20.h,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "+966",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    )
                  : null,
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(16.r),
                      child: AppImage(
                        widget.prefixIcon!,
                        height: 22.h,
                        width: 22.h,
                      ),
                    )
                  : null,
              suffixIcon: widget.inputType == InputType.password
                  ? IconButton(
                      icon: Icon(
                        isHidden ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).primaryColor.withOpacity(isHidden ? .5 : 1),
                      ),
                      onPressed: () {
                        isHidden = !isHidden;

                        setState(() {}); // update
                      },
                    )
                  : null),
        ),
      ),
    );
  }
}
