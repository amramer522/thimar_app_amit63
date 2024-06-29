import 'package:app/views/test_responsive/components/my_app_bar/view.dart';
import 'package:flutter/material.dart';

class TestResponsiveMobileView extends StatelessWidget {
  const TestResponsiveMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Colors.green,
      body: Center(
        child: Text("Mobile"),
      ),
    );
  }
}
