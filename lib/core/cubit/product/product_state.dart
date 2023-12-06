import 'package:e_commerce_training/models/product/product_model.dart';

abstract class ProductState {}

class InitialStateProduct extends ProductState {}

class DoneStateProduct extends ProductState {
  final ProductModel product;

  DoneStateProduct(this.product);
}

class ErrorStateProduct extends ProductState {
  String error;

  ErrorStateProduct(this.error);
}
