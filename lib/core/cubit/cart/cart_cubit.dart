import 'package:e_commerce_training/core/managers/custom_snak_bar.dart';
import 'package:e_commerce_training/core/managers/values.dart';
import 'package:e_commerce_training/core/network/remote/api_constants.dart';
import 'package:e_commerce_training/core/network/remote/dio_helper.dart';
import 'package:e_commerce_training/models/cart_model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialCartState());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);
  CartModel? cartModel;


  void addToCart(BuildContext context,
      {required String productId, required String productName}) {
    DioHelperStore.postData(url: ApiConstants.addToCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": "1"
    }).then((value) {
      print(value);
      print("added Successfully");
      showSnakBar(context, "$productName added to cart successfully");
      emit(AddToCartState());
      getCartProducts();
    }).catchError((error) {
      showSnakBar(context, error.toString());
      emit(ErrorAddToCartState(error: error));
    });
  }

  Future<CartModel>? getCartProducts() {
    DioHelperStore.getData(url: ApiConstants.getAllProductsCartApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      print("got product Successfully");
      cartModel = CartModel.fromJson(value.data);
      emit(GetCartState());
      return cartModel;
    }).catchError((error) {
      emit(ErrorGetCartState(error: error.toString()));
      return null;
    });
    return null;
  }

  void deleteProductFromCart(BuildContext context,
      {required String productId, required String productName}) {
    DioHelperStore.delData(url: ApiConstants.deleteFromCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
    }).then((value) {
      print("daleted");
      showSnakBar(context, "$productName removed to cart successfully");
      emit(DeleteCartState());
      getCartProducts();
    }).catchError((error) {
      emit(ErrorDeleteCartState(error: error));
      showSnakBar(context, error.toString());
    });
  }

  void updateQuantity(int quantity, String productId) {
    DioHelperStore.putData(url: ApiConstants.updateQuantityCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": quantity
    }).then((value) {
      emit(UpdateCartState());
      getCartProducts();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUpdateCartState(error: error.toString()));
    });
  }

  bool isProductInCart(int index) {
    if (cartModel != null) {
      final products = cartModel!.products;
      if (index >= 0 && index < products!.length) {
        final product = products[index];
        return product.quantity > 0;
      }
    }
    return false;
  }
}
