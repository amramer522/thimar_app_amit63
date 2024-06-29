import 'package:flutter/material.dart';

import '../components/my_app_bar/view.dart';

class TestResponsiveTabletView extends StatelessWidget {
  const TestResponsiveTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),

      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.menu)),
          Center(
            child: Text("Tablet"),
          ),
        ],
      ),
    );
  }
}

class Amr extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
