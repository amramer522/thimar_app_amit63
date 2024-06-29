import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFailed extends StatelessWidget {
  final String msg;
  final VoidCallback onPress;

  const AppFailed({super.key, required this.msg, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(msg),
          SizedBox(height: 16.h,),
         FilledButton(
            onPressed: onPress,
            child: Text("Try Again"),
          ),
        ],
      ),
    );
  }
}
