import 'package:e_commerce_training/core/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../screens/modules/home_screen.dart';
import '../../managers/navigation.dart';
import '../../network/remote/api_constants.dart';
import '../../network/remote/dio_helper.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(InitialStateSignIn());

  static SignInCubit get(BuildContext context) => BlocProvider.of(context);

  void userLogin(BuildContext context, String email, String password) {
    DioHelperStore.postData(url: ApiConstants.loginApi, data: {
      "email": email,
      "password": password,
    }).then((value) {
      // UserData.fromJson(value.data);
      // print(value.data);
      emit(DoneStateSignIn());
      navigateAndFinishThisScreen(context, const HomeScreen());
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorStateSignIn(onError.toString()));
    });
  }
}
