import 'package:flutter/material.dart';

class MyAppBarTablet extends StatelessWidget {
  const MyAppBarTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Text("Home"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_rounded),
        ),
      ],
    );
  }
}
