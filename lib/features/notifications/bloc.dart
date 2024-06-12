import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class GetNotificationsBloc extends Bloc<GetNotificationsEvents, GetNotificationsStates> {
  final DioHelper _dio;

  GetNotificationsBloc(this._dio) : super(GetNotificationsStates()) {
    on<GetNotificationsEvent>(_getData);
  }

  void _getData(GetNotificationsEvent event,
      Emitter<GetNotificationsStates> emit,) async {
    emit(GetNotificationsLoadingState());

    final response = await _dio.get("");
    if (response.isSuccess) {
      emit(GetNotificationsSuccessState());
    } else {
      emit(GetNotificationsFailedState(msg: response.msg, statusCode: response.statusCode));
    }
  }
}
