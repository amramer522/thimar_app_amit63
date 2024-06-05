import 'dart:async';
import 'dart:io';

import 'package:app/core/logic/helper_methods.dart';
import 'package:app/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';

part 'states.dart';

part 'events.dart';

class OTPBloc extends Bloc<OTPEvents, OTPStates> {
  final DioHelper _dio;

  OTPBloc(this._dio) : super(OTPStates()) {
    on<VerifyOTPEvent>(_sendData);
  }

  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();

  Future<void> _sendData(VerifyOTPEvent event, Emitter<OTPStates> emit) async {
    if (formKey.currentState!.validate()) {
      emit(VerifyOTPLoadingState());
      final response = await _dio.send("verify", data: {
        "phone": event.phone,
        "code": codeController.text,
        "device_token": "test",
        "type": Platform.operatingSystem,
      });
      if (response.isSuccess) {
        showMessage(response.message!.isEmpty ? "تم تفعيل حسابك بنجاح" : response.message!,
            messageType: MessageType.success);
        navigateTo(const LoginView(), keepHistory: false);
        emit(VerifyOTPSuccessState());
      } else {
        showMessage(response.message!);
        emit(VerifyOTPFailedState());
      }
    }
  }
}
