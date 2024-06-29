import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'model.dart';

part 'item.dart';

part 'message_box.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(24),
              reverse: true,
              itemBuilder: (context, index) => _Item(
                model: _fakeList[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),
              itemCount: _fakeList.length,
            ),
          ),
          _MessageBox(
            onMessageAdded: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
