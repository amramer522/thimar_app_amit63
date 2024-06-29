import 'package:app/core/logic/responsive.dart';
import 'package:flutter/material.dart';

import '../components/my_app_bar/view.dart';

class TestResponsiveWebView extends StatelessWidget {
  const TestResponsiveWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Colors.red,
      body: Column(
        children: [
          if(Responsive.isWeb(context))
            Text("Amoor Mobile"),
          Row(
            children: List.generate(
              6,
              (index) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text("Hello$index")),
            ),
          )
        ],
      ),
    );
  }
}
