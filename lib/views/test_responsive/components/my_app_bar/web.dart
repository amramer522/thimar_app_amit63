import 'package:flutter/material.dart';

class MyAppBarWeb extends StatelessWidget {
  const MyAppBarWeb({super.key});

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
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.ac_unit),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.access_alarm),
        ),
      ],
    );
  }
}
