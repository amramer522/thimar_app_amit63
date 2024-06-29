part of 'view.dart';
class _MessageModel {
  final String body;
  final String type, date;
  final bool isMe;

  _MessageModel({
    required this.body,
    required this.type,
    required this.date,
    required this.isMe,
  });
}


final _fakeList = [
  _MessageModel(
    body: "Hello",
    type: "text",
    date: "10:48 PM",
    isMe: true,
  ),
  _MessageModel(
    body: "hey How are you?",
    type: "text",
    date: "10:49 PM",
    isMe: false,
  ),
  _MessageModel(
    body: "I am fine",
    type: "text",
    date: "10:50 PM",
    isMe: true,
  ),
  _MessageModel(
    body: "how old are you?",
    type: "text",
    date: "10:55 PM",
    isMe: true,
  ),
  _MessageModel(
    body: "I am 27 years old",
    type: "text",
    date: "10:59 PM",
    isMe: false,
  ),
  _MessageModel(
      body: "my names is amr mohamed hassan amer how can i help you",
      type: "text",
      date: "11:00 PM",
      isMe: false),
  _MessageModel(
    body: "good bye",
    type: "text",
    date: "11:18 PM",
    isMe: false,
  ),
  _MessageModel(
    body: "how old are you?",
    type: "text",
    date: "10:55 PM",
    isMe: true,
  ),
  _MessageModel(
    body: "I am 27 years old",
    type: "text",
    date: "10:59 PM",
    isMe: false,
  ),
  _MessageModel(
      body: "my names is amr mohamed hassan amer how can i help you",
      type: "text",
      date: "11:00 PM",
      isMe: false),
  _MessageModel(
    body: "good bye",
    type: "text",
    date: "11:18 PM",
    isMe: false,
  ),
  _MessageModel(
    body: "how old are you?",
    type: "text",
    date: "10:55 PM",
    isMe: true,
  ),
  _MessageModel(
    body: "I am 27 years old",
    type: "text",
    date: "10:59 PM",
    isMe: false,
  ),
  _MessageModel(
      body: "my names is amr mohamed hassan amer how can i help you",
      type: "text",
      date: "11:00 PM",
      isMe: false),
  _MessageModel(
    body: "good bye",
    type: "text",
    date: "11:18 PM",
    isMe: false,
  ),
];