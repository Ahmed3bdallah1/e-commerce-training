import 'package:e_commerce_training/core/cubit/profile/profile_state.dart';
import 'package:e_commerce_training/core/managers/custom_snak_bar.dart';
import 'package:e_commerce_training/core/managers/values.dart';
import 'package:e_commerce_training/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/remote/api_constants.dart';
import '../../network/remote/dio_helper.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUser(BuildContext context) {
    DioHelperStore.postData(
        url: ApiConstants.getProfileApi, data: {"token": token}).then((value) {
      print("------ user data -----");
      print(value.data);
      userModel = UserModel.fromJson(value.data);
      emit(GotProfileInfoState());
    }).catchError((error) {
      showSnakBar(context, error);
      emit(ErrorProfileState(error: error.toString()));
    });
  }
}
