part of 'bloc.dart';

class AppInfoStates{}


class GetAppInfoLoadingState extends AppInfoStates{}
class GetAppInfoSuccessState extends AppInfoStates{
  final AppInfoModel model;

  GetAppInfoSuccessState({required this.model});

}
class GetAppInfoFailedState extends AppInfoStates{
  final String msg;

  GetAppInfoFailedState({required this.msg});

}