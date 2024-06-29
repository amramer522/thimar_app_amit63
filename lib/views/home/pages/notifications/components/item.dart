part of '../view.dart';

class _Item extends StatefulWidget {
  final int index;
  final NotificationModel model;

  const _Item({super.key, required this.index, required this.model});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.model.isRead = true;
        setState(() {});
      },
      child: Slidable(
        key: ValueKey("${widget.index}"),
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 12.h,
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppImage(
                  widget.model.img,
                  height: 33.h,
                  width: 33.h,
                ),
                SizedBox(width: 5.w),
                VerticalDivider(color: Colors.grey.withOpacity(.5)),
                SizedBox(width: 5.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        widget.model.body,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Color(0xff989898),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        widget.model.time,
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                if (!widget.model.isRead)
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Theme.of(context).primaryColor,
                  )
              ],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.04),
                  offset: Offset(0, 5),
                  blurRadius: 10,
                )
              ]),
        ),
      ),
    );
  }
}
