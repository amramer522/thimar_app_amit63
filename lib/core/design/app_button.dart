import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  const AppButton({super.key, this.text = "", required this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return FilledButton.icon(
          onPressed: null,
          icon: SizedBox(
            height: 20.h,
            width: 20.h,
            child: const CircularProgressIndicator(strokeWidth: 2,),
          ),
          label: Text(text));
    }
    return FilledButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
