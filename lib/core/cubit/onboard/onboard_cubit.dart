import 'package:e_commerce_training/core/cubit/onboard/onboard_state.dart';
import 'package:e_commerce_training/core/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screens/modules/signin.dart';
import '../../managers/navigation.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(InitialOnboardState());

  static OnboardCubit get(BuildContext context) => BlocProvider.of(context);
  bool isLastPage = false;
  int screenIndex = 0;

  void lastPage(int index) {
    isLastPage = true;
    screenIndex = index;
    print(screenIndex);
    emit(LastPageState());
  }

  void notLastPage(int index) {
    isLastPage = false;
    screenIndex = index;
    // print(screenIndex);
    emit(NotLastPageState());
  }

  void submit(BuildContext context) {
    CacheHelper.saveData(key: "boarding", value: true)
        .then((value) => navigateToNextScreen(context, SignInScreen()));
  }
}
