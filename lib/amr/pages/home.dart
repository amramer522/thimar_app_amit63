import 'dart:async';
import 'dart:io';

import 'package:app/amr/data/filter_data.dart';
import 'package:app/core/design/app_image.dart';
import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_volume_keydown/flutter_android_volume_keydown.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

part 'components/filters_list.dart';

part 'components/controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final deepArController = DeepArController();

  Future<void> initController() async {
    await deepArController.initialize(
      androidLicenseKey:
          "e958bf43b0304a74ea674b4e77b7abf45d2ea9002f1aa275a788c0a1d26fe5ac06e98e1f80f4f549",
      iosLicenseKey:
          "b7c5e137bfc3daccb0e1aef1fe924136077bc78ecf835621b4e34aef9fafbfb4e7045f0634d09340",
      resolution: Resolution.high,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: initController(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Transform.scale(
                      scale: 1.2, child: DeepArPreview(deepArController)),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _FiltersList(controller: deepArController),
                      _Controllers(controller: deepArController),
                    ],
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
