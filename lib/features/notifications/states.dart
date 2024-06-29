part of 'bloc.dart';

class GetNotificationsStates {}

class GetNotificationsLoadingState extends GetNotificationsStates {}

class GetNotificationsFailedState extends GetNotificationsStates {
  final String msg;


  GetNotificationsFailedState({required this.msg});
}

class GetNotificationsSuccessState extends GetNotificationsStates {
  final List<NotificationModel> list;

  GetNotificationsSuccessState({required this.list});
}