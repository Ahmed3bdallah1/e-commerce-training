import 'package:e_commerce_training/core/cubit/profile/profile_cubit.dart';
import 'package:e_commerce_training/core/managers/custom_snak_bar.dart';
import 'package:e_commerce_training/core/managers/values.dart';
import 'package:e_commerce_training/core/network/remote/api_constants.dart';
import 'package:e_commerce_training/core/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/user/user_model.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(BuildContext context) => BlocProvider.of(context);
  UserModel? userModel;

  void updateProfile(
      {required BuildContext context,
      required String name,
      required String email,
      required String phone,
      String? gender}) {
    DioHelperStore.putData(url: ApiConstants.updateProfileApi, data: {
      "name": name,
      "email": email,
      "phone": phone,
      "gender": gender ?? "male",
      "password": "12345678",
      "token": token
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      ProfileCubit.get(context).getUser(context);
      print(userModel);
      emit(SuccessEditProfile());
      Navigator.pop(context);
    }).timeout(const Duration(seconds: 6), onTimeout: () {
      showSnakBar(context, "request timed out, please check your connection");
    }).catchError((error) {
      showSnakBar(context, error);
      emit(ErrorEditProfile(error: error.toString()));
    });
  }
}
