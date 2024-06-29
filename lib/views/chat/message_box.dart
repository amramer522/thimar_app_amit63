part of 'view.dart';
class _MessageBox extends StatefulWidget {
  final VoidCallback onMessageAdded;
  const _MessageBox({super.key,required this.onMessageAdded, });

  @override
  State<_MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<_MessageBox> {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: messageController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: "Write your message",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          IconButton(
            onPressed: () async {
              final result = await ImagePicker()
                  .pickImage(source: ImageSource.gallery);
              if (result != null) {
                _fakeList.insert(
                    0,
                    _MessageModel(
                        body: result.path,
                        type: "image",
                        date: DateTime.now().toString(),
                        isMe: true));
                widget.onMessageAdded();
              }
            },
            icon: Icon(Icons.camera_alt),
          ),
          IconButton(
            onPressed: () {
              _fakeList.insert(
                  0,
                  _MessageModel(
                      body: messageController.text,
                      type: "text",
                      date: DateTime.now().toString(),
                      isMe: true));
              messageController.clear();
              widget.onMessageAdded();
            },
            icon: Icon(
              Icons.send,
              color: messageController.text.isEmpty
                  ? Colors.grey.withOpacity(.3)
                  : Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
