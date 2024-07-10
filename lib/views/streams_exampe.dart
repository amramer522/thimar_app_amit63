import 'dart:async';

import 'package:flutter/material.dart';

class StreamsExampleView extends StatefulWidget {
  const StreamsExampleView({super.key});

  @override
  State<StreamsExampleView> createState() => _StreamsExampleViewState();
}

class _StreamsExampleViewState extends State<StreamsExampleView> {
  final controller = StreamController<String>.broadcast();
  int count = 1;


  @override
  void initState() {
    super.initState();
    controller.stream.listen((event) {
      print(event);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.add("Hello ${++count}");
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: StreamBuilder(
          stream: controller.stream,
          initialData: "Hello $count",
          builder: (context, snapshot) => Text(
            "${snapshot.data}",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
