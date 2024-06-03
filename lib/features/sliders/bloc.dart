import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';

part 'states.dart';

part 'events.dart';

part 'model.dart';

class SliderBloc extends Bloc<SliderEvents, SliderStates> {
  final DioHelper _dio;

  SliderBloc(this._dio) : super(GetSliderLoadingState()) {
    on<GetSliderEvent>(_getData);
  }

  Future<void> _getData(GetSliderEvent event, Emitter<SliderStates> emit) async {
    final response = await _dio.get("sliders");

    if (response.isSuccess) {
      final list = SliderData.fromJson(response.data).list;
      emit(GetSliderSuccessState(list: list));
    } else {
      emit(GetSliderFailedState(msg: response.message!));
    }
  }
}
