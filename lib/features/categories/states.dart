part of 'bloc.dart';
class CategoriesStates{}

class GetCategoriesLoadingState extends CategoriesStates{}
class GetCategoriesSuccessState extends CategoriesStates{
  final List<CategoryModel> list;

  GetCategoriesSuccessState({required this.list});
}
class GetCategoriesFailedState extends CategoriesStates{
  final String msg;

  GetCategoriesFailedState({required this.msg});
}
