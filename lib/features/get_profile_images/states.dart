part of 'bloc.dart';

class GetProfileImagesStates {}

class GetProfileImagesLoadingState extends GetProfileImagesStates {}

class GetProfileImagesFailedState extends GetProfileImagesStates {
  final String msg;


  GetProfileImagesFailedState({required this.msg});
}

class GetProfileImagesSuccessState extends GetProfileImagesStates {
  final List<String> list;

  GetProfileImagesSuccessState({required this.list});
}