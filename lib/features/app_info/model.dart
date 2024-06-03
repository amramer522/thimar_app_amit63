part of 'bloc.dart';

class AppInfoData {
  late final AppInfoModel model;

  AppInfoData.fromJson(Map<String, dynamic> json) {
    model = AppInfoModel.fromJson(json['data'] ?? {});
  }
}

class AppInfoModel {
  late final String terms;

  AppInfoModel.fromJson(Map<String, dynamic> json) {
    terms = json['terms'] ?? "";
  }
}
