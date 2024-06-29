import 'dart:async';
import 'dart:io';

import 'package:app/core/logic/helper_methods.dart';
import 'package:app/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';

part 'states.dart';

part 'events.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final DioHelper _dio;

  LoginBloc(this._dio) : super(LoginStates()) {
    on<LoginEvent>(_sendData);
  }

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController(text: "550011223344");
  final passwordController = TextEditingController(text: "123456789");

  Future<void> _sendData(LoginEvent event, Emitter<LoginStates> emit) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final response = await _dio.send("login", data: {
        "phone": phoneController.text,
        "password": passwordController.text,
        "device_token": "test",
        "type": Platform.operatingSystem,
        "user_type": "client"
      });
      if (response.isSuccess) {

        emit(LoginSuccessState());
      } else {
        showMessage(response.message!);
        emit(LoginFailedState());
      }
    }
  }
}
