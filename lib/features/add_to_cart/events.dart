part of 'bloc.dart';

class AddToCartEvents {}

class AddToCartEvent extends AddToCartEvents {
  final int id;
  final double amount;

  AddToCartEvent({
    required this.id,
    this.amount = 1,
  });
}
