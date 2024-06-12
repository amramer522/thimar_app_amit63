import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';

part 'events.dart';

part 'model.dart';

part 'states.dart';

class GetProfileImagesBloc extends Bloc<GetProfileImagesEvents, GetProfileImagesStates> {
  final DioHelper _dio;

  GetProfileImagesBloc(this._dio) : super(GetProfileImagesStates()) {
    on<GetProfileImagesEvent>(_getData);
  }

  void _getData(
    GetProfileImagesEvent event,
    Emitter<GetProfileImagesStates> emit,
  ) async {
    emit(GetProfileImagesLoadingState());

    await Dio().get("https://thimar-app-amit-63-default-rtdb.firebaseio.com/photos.json").then(
      (value) {
        final list =List.from(value.data).map((e) => e.toString(),).toList();
        emit(
          GetProfileImagesSuccessState(
            list: list,
          ),
        );
      },
    ).catchError((ex) {
      emit(GetProfileImagesFailedState(msg: ex.toString()));
    });
  }
}
