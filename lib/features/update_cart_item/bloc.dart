import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';


part 'events.dart';

part 'states.dart';

class UpdateCartItemBloc extends Bloc<UpdateCartItemEvents, UpdateCartItemStates> {
  final DioHelper _dio;
  UpdateCartItemBloc(this._dio) : super(UpdateCartItemStates()) {
    on<UpdateCartItemEvent>(_sendData);
  }

  Future<void> _sendData(
    UpdateCartItemEvent event,
    Emitter<UpdateCartItemStates> emit,
  ) async {
    emit(UpdateCartItemLoadingState());

    final response = await _dio.send("client/cart/${event.id}",data: {
      "amount":event.isAdd?event.amount+1:event.amount-1,
      "_method":"PUT"
    });
    print("id :${event.id}");
    print("amount :${event.isAdd?event.amount+1:event.amount-1}");

    if(response.isSuccess)
      {
        showMessage("تم التعديل بنجاح");
        emit(UpdateCartItemSuccessState(id: event.id,isAdd: event.isAdd));
      }else
        {
          emit(UpdateCartItemFailedState(msg: response.message!));
        }


  }
}
