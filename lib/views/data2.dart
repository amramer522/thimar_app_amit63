import 'dart:convert';

import 'package:app/core/design/app_image.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/design/app_failed.dart';
import '../core/design/app_loading.dart';
import '../core/logic/firebase_helper.dart';
import '../features/get_profile/bloc.dart';
import '../features/get_profile_images/bloc.dart';
import 'package:firebase_database/firebase_database.dart';

class Data2View extends StatefulWidget {
  const Data2View({super.key});

  @override
  State<Data2View> createState() => _Data2ViewState();
}

class _Data2ViewState extends State<Data2View> {
  final ref = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    FirebaseHelper().getFCMToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // show notification
         FirebaseHelper().notifyNow("amoor","1111111");
        },
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data?.snapshot.value as Map;
            final model = ProfileData.fromJson(data);
            return Column(
              children: [
                AppImage(
                  model.image,
                  height: 300,
                ),
                Text(
                  model.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  "${model.age}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Wrap(
                  children: List.generate(
                    2,
                    (index) => AppImage(
                      "",
                      height: 100,
                      width: 100,
                    ),
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return AppFailed(
              msg: "msg",
              onPress: () {},
            );
          } else {
            return AppLoading();
          }
        },
        stream: ref.child("profile").onValue,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     .listen((event) {
      //       print(event.snapshot.value);
      //     },);
      //   },
      // ),
    );
  }
}
