import 'dart:convert';

import 'package:app/core/design/app_button.dart';
import 'package:app/core/design/app_image.dart';
import 'package:app/features/convert_text_to_image/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../core/design/app_failed.dart';
import '../core/design/app_loading.dart';

class TextToImageView extends StatefulWidget {
  const TextToImageView({super.key});

  @override
  State<TextToImageView> createState() => _TextToImageViewState();
}

class _TextToImageViewState extends State<TextToImageView> {
  final bloc = GetIt.instance<ConvertTextToImageBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              children: [
                SizedBox(
                  height: 300.h,
                  width: 300.h,
                  child: Center(
                    child: BlocBuilder(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is ConvertTextToImageFailedState) {
                          return Text(
                            state.msg,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),
                          );
                        } else if (state is ConvertTextToImageSuccessState) {
                          return Image.memory(
                            base64Decode(state.image),
                            height: 300.h,
                            width: 300.h,
                          );
                        } else if (state is ConvertTextToImageLoadingState) {
                          return const AppLoading();
                        } else {
                          return AppImage(
                            "https://optimaldataintelligence.com/wp-content/themes/optimaldataintelligence/images/image-not-found.png",
                            height: 300.h,
                            width: 300.h,
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Form(
                  key: bloc.formKey,
                  child: TextFormField(
                    controller: bloc.textController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Write the text you want to convert";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) => AppButton(
                    onPressed: () {
                      bloc.add(ConvertTextToImageEvent());
                    },
                    isLoading: state is ConvertTextToImageLoadingState,
                    text: "Convert To Image",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
