import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';

part 'model.dart';

part 'states.dart';

part 'events.dart';

class ProductsBloc extends Bloc<ProductsEvents, ProductsStates> {
  final DioHelper _dio;

  ProductsBloc(this._dio) : super(GetProductsLoadingState()) {
    on<GetProductsEvent>(_getData);
  }

  Future<void> _getData(GetProductsEvent event, Emitter<ProductsStates> emit) async {
    final response = await _dio.get("products");

    if (response.isSuccess) {
      final list = ProductsData.fromJson(response.data).list;
      emit(GetProductsSuccessState(list: list));
    } else {
      emit(GetProductsFailedState(msg: response.message!));
    }
  }
}
