part of 'bloc.dart';

class GetNotificationsStates {}

class GetNotificationsLoadingState extends GetNotificationsStates {}

class GetNotificationsFailedState extends GetNotificationsStates {
  final String msg;
  final int? statusCode;


  GetNotificationsFailedState({required this.msg, this.statusCode});
}

class GetNotificationsSuccessState extends NotificationsStates {}