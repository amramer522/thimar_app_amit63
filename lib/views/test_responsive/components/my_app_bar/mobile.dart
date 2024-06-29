import 'package:flutter/material.dart';

class MyAppBarMobile extends StatelessWidget {
  const MyAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Text("Home"),
    );
  }
}
