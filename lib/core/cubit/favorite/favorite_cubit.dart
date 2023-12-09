import 'package:e_commerce_training/core/cubit/favorite/favorite_state.dart';
import 'package:e_commerce_training/core/managers/custom_snak_bar.dart';
import 'package:e_commerce_training/core/network/remote/api_constants.dart';
import 'package:e_commerce_training/core/network/remote/dio_helper.dart';
import 'package:e_commerce_training/models/favorite_model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/values.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(InitialFavoriteState());

  static FavoriteCubit get(BuildContext context) => BlocProvider.of(context);
  FavoriteModel? favoriteModel;

  void addToFavorite(BuildContext context, String productId) {
    DioHelperStore.postData(url: ApiConstants.favoriteApi, data: {
      "nationalId": nationalId,
      "productId": productId,
    }).then((value) {
      print(value.data);
      favoriteModel = FavoriteModel.fromJson(value.data);
      showSnakBar(context, "Item added to favorites");
      getFavorite();
      emit(AddToFavoriteState());
    }).catchError((error) {
      emit(ErrorAddToFavoriteState(error: error.toString()));
    });
  }

  Future<FavoriteModel>? getFavorite() {
    DioHelperStore.getData(url: ApiConstants.favoriteApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      print(value.data);
      favoriteModel = FavoriteModel.fromJson(value.data);
      emit(GetFavoriteState());
      return favoriteModel;
    }).catchError((error) {
      emit(ErrorGetFavoriteState(error: error.toString()));
      return null;
    });
  }

  void deleteFavorite(BuildContext context, {required String productId}) {
    DioHelperStore.getData(url: ApiConstants.favoriteApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      print(value.data);
      showSnakBar(context, "item removed successfully");
      getFavorite();
      emit(DeleteFavoriteState());
    }).catchError((error) {
      emit(ErrorDeleteFavoriteState(error: error.toString()));
    });
  }
}
