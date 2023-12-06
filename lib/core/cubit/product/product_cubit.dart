import 'package:e_commerce_training/core/cubit/product/product_state.dart';
import 'package:e_commerce_training/core/network/remote/api_constants.dart';
import 'package:e_commerce_training/core/network/remote/dio_helper.dart';
import 'package:e_commerce_training/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(InitialStateProduct());

  static ProductCubit get(BuildContext context) => BlocProvider.of(context);
  ProductModel? productModel;

  void getProduct() {
    DioHelperStore.getData(url: ApiConstants.productLaptopApi).then((value) {
      print("----- got products successfully -----");
      productModel = ProductModel.fromJson(value.data);
      emit(DoneStateProduct(productModel!));
    }).catchError((error) {
      print("----- error -----");
      print(error.toString());
      emit(ErrorStateProduct(error));
    });
  }
}
