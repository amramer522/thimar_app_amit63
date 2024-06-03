import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';

part 'model.dart';

part 'states.dart';

part 'events.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesStates> {
  final DioHelper _dio;

  CategoriesBloc(this._dio) : super(GetCategoriesLoadingState()) {
    on<GetCategoriesEvent>(_getData);
  }

  Future<void> _getData(GetCategoriesEvent event, Emitter<CategoriesStates> emit) async {
    final response = await _dio.get("categories");
    if (response.isSuccess) {
      final list = CategoriesData.fromJson(response.data).list;
      emit(GetCategoriesSuccessState(list: list));
    } else {
      emit(GetCategoriesFailedState(msg: response.message!));
    }
  }
}
