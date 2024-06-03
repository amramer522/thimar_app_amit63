import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';

part 'events.dart';
part 'states.dart';
part 'model.dart';

class AppInfoBloc extends Bloc<AppInfoEvents,AppInfoStates> {
  final DioHelper _dio;
  AppInfoBloc(this._dio) : super(GetAppInfoLoadingState()){
    on<GetAppInfoEvent>(_getData);

  }
  Future<void> _getData(GetAppInfoEvent event, Emitter<AppInfoStates> emit) async
  {
    final response = await _dio.get("endpoint");
    if (response.isSuccess) {
      final model = AppInfoData.fromJson(response.data).model;
      emit(GetAppInfoSuccessState(model: model));
    } else {
      emit(GetAppInfoFailedState(msg: response.message!));
    }
  }
}
