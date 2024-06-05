import 'package:app/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class AddToCartBloc extends Bloc<AddToCartEvents, AddToCartStates> {
  final DioHelper _dio;

  AddToCartBloc(this._dio) : super(AddToCartStates()) {
    on<AddToCartEvent>(_sendData);
  }

  void _sendData(
    AddToCartEvent event,
    Emitter<AddToCartStates> emit,
  ) async {
    emit(AddToCartLoadingState(id: event.id));
    final response = await _dio.send("client/cart", data: {
      "product_id": event.id,
      "amount": event.amount,
    });
    if (response.isSuccess) {
      showMessage(response.message!,messageType: MessageType.success);
      emit(AddToCartSuccessState(msg: response.message!));
    } else {
      showMessage(response.message!);

      emit(AddToCartFailedState(msg: response.message!));
    }
  }
}
