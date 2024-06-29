part of 'bloc.dart';

class ConvertTextToImageStates {}

class ConvertTextToImageLoadingState extends ConvertTextToImageStates {}

class ConvertTextToImageFailedState extends ConvertTextToImageStates {
  final String msg;
  final int? statusCode;


  ConvertTextToImageFailedState({required this.msg, this.statusCode});
}

class ConvertTextToImageSuccessState extends ConvertTextToImageStates {
  final String image;

  ConvertTextToImageSuccessState({
    required this.image,
  });
}