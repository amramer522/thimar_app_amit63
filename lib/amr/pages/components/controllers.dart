part of '../home.dart';

class _Controllers extends StatefulWidget {
  final DeepArController controller;

  const _Controllers({super.key, required this.controller});

  @override
  State<_Controllers> createState() => _ControllersState();
}

class _ControllersState extends State<_Controllers> {
  File? lastImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: widget.controller.flipCamera,
          icon: const Icon(
            Icons.flip_camera_ios_outlined,
            size: 34,
            color: Colors.white,
          ),
        ),
        FilledButton(
          onPressed: () async {
            lastImage = await widget.controller.takeScreenshot();
            await ImageGallerySaver.saveImage(lastImage!.readAsBytesSync());
            print(lastImage?.path);
            setState(() {});
          },
          child: AppImage(
            "camera.svg",
            color: Colors.white,
          ),
        ),
        // IconButton(
        //   onPressed: widget.controller.toggleFlash,
        //   icon: const Icon(
        //     Icons.flash_on,
        //     size: 34,
        //     color: Colors.white,
        //   ),
        // ),
        lastImage != null
            ? GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AppImage(lastImage!.path),
                  );
                },
                child: ClipOval(
                  child: AppImage(
                    lastImage!.path,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ))
            : const SizedBox(
                height: 60,
                width: 60,
              )
      ],
    );
  }
}
