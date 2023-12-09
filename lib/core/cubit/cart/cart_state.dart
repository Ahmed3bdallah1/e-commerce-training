abstract class CartState {}

class InitialCartState extends CartState {}

class AddToCartState extends CartState {}

class ErrorAddToCartState extends CartState {
  final String error;

  ErrorAddToCartState({required this.error});
}

class GetCartState extends CartState {}

class ErrorGetCartState extends CartState {
  final String error;

  ErrorGetCartState({required this.error});
}

class DeleteCartState extends CartState {}

class ErrorDeleteCartState extends CartState {
  final String error;

  ErrorDeleteCartState({required this.error});
}

class UpdateCartState extends CartState {}

class ErrorUpdateCartState extends CartState {
  final String error;

  ErrorUpdateCartState({required this.error});
}
