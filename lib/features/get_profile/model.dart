part of "bloc.dart";
class ProfileData {

  late final int age;
  late final String image;
  late final String name;

  ProfileData.fromJson(Map<dynamic, dynamic> json){
    age = json['age']??0;
    image = json['image']??"";
    name = json['name']??"";
  }
}