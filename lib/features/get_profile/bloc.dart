import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';

part 'events.dart';

part 'model.dart';

part 'states.dart';

class GetProfileBloc extends Bloc<GetProfileEvents, GetProfileStates> {
  final DioHelper _dio;

  GetProfileBloc(this._dio) : super(GetProfileStates()) {
    on<GetProfileEvent>(_getData);
  }

  void _getData(
    GetProfileEvent event,
    Emitter<GetProfileStates> emit,
  ) async {
    emit(GetProfileLoadingState());

    await Dio().get("https://thimar-app-amit-63-default-rtdb.firebaseio.com/profile.json").then(
      (value) {
        final model = ProfileData.fromJson(value.data);
        emit(GetProfileSuccessState(model: model));
      },
    ).catchError((ex) {
      emit(GetProfileFailedState(msg: ex.message!));
    });
    // if (response.isSuccess) {
    //   final model = ProfileData.fromJson(response.data);
    //   emit(GetProfileSuccessState(model: model));
    // } else {
    //   emit(GetProfileFailedState(msg: response.message!));
    // }
  }
}
