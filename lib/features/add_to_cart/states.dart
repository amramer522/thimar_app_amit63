part of 'bloc.dart';

class AddToCartStates {}

class AddToCartLoadingState extends AddToCartStates {
  final int id;

  AddToCartLoadingState({required this.id});
}

class AddToCartFailedState extends AddToCartStates {
  final String msg;


  AddToCartFailedState({required this.msg});
}

class AddToCartSuccessState extends AddToCartStates {
  final String msg;

  AddToCartSuccessState({
    required this.msg,
  });
}