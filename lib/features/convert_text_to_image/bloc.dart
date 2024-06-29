import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class ConvertTextToImageBloc
    extends Bloc<ConvertTextToImageEvents, ConvertTextToImageStates> {
  final DioHelper _dio;

  ConvertTextToImageBloc(this._dio) : super(ConvertTextToImageStates()) {
    on<ConvertTextToImageEvent>(_sendData);
  }

  final formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  void _sendData(
    ConvertTextToImageEvent event,
    Emitter<ConvertTextToImageStates> emit,
  ) async {
    if (formKey.currentState!.validate()) {
      emit(ConvertTextToImageLoadingState());
      try {
        final response = await Dio(
            BaseOptions(baseUrl: "https://api.stability.ai/", headers: {
          "Content-Type": "application/json",
          "Stability-Client-Version": "1.2.1",
          "Stability-Client-ID": "my-great-plugin",
          "Authorization":
              "Bearer sk-IKZWrDIjVomKStKLyfr5jUmPQX9gorUid7hhoV3vPZjyUK71",
          // "Accept": "image/png"
        })).post(
          "v1/generation/stable-diffusion-v1-6/text-to-image",
          data: {
            "cfg_scale": 7,
            "height": 512,
            "width": 512,
            "sampler": "K_DPM_2_ANCESTRAL",
            "samples": 1,
            "steps": 30,
            "text_prompts": [
              {
                "text": textController.text,
                "weight": 1,
              }
            ]
          },
        );
        if (response.statusCode == 200) {
          emit(
            ConvertTextToImageSuccessState(
              image: response.data["artifacts"][0]["base64"],
            ),
          );
        } else {
          emit(ConvertTextToImageFailedState(msg: response.data ?? "Failed"));
        }
      } on DioException catch (ex) {
        String? msg = ex.response?.data?["message"];
        emit(ConvertTextToImageFailedState(msg: msg?? "Failed"));
      }
    }
  }
}
