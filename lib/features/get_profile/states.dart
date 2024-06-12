part of 'bloc.dart';

class GetProfileStates {}

class GetProfileLoadingState extends GetProfileStates {}

class GetProfileFailedState extends GetProfileStates {
  final String msg;
  final int? statusCode;


  GetProfileFailedState({required this.msg, this.statusCode});
}

class GetProfileSuccessState extends GetProfileStates {
  final ProfileData model;

  GetProfileSuccessState({required this.model});
}