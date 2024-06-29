part of 'view.dart';
class _Item extends StatelessWidget {
  final _MessageModel model;

  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: model.isMe
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: model.isMe
              ? Theme.of(context).primaryColor.withOpacity(.3)
              : Colors.grey,
        ),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              model.type == "image"
                  ? Image.file(
                File(model.body),
              )
                  : Text(
                model.body,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(model.date,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).hintColor,
                        )),
                    Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

