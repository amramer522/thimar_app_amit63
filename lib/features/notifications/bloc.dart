import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';

part 'events.dart';

part 'model.dart';

part 'states.dart';

class GetNotificationsBloc extends Bloc<GetNotificationsEvents, GetNotificationsStates> {
  final DioHelper _dio;

  GetNotificationsBloc(this._dio) : super(GetNotificationsLoadingState()) {
    on<GetNotificationsEvent>(_getData);
  }

  void _getData(
    GetNotificationsEvent event,
    Emitter<GetNotificationsStates> emit,
  ) async {
    final response = await _dio.get("notifications");
    if (response.isSuccess) {
      final model = NotificationsData.fromJson(response.data["data"]);
      emit(GetNotificationsSuccessState(list: model.list));
    } else {
      emit(GetNotificationsFailedState(msg: response.message!));
    }
  }
}
