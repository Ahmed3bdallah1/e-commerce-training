import 'package:e_commerce_training/core/cubit/login/login_cubit.dart';
import 'package:e_commerce_training/core/cubit/onboard/onboard_cubit.dart';
import 'package:e_commerce_training/core/managers/values.dart';
import 'package:e_commerce_training/core/network/local/cache_helper.dart';
import 'package:e_commerce_training/core/network/remote/dio_helper.dart';
import 'package:e_commerce_training/screens/modules/onboard.dart';
import 'package:e_commerce_training/screens/modules/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubit/register/register_cubit.dart';
import 'core/managers/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelperStore.init();
  boarding = CacheHelper.getData(key: "boarding") ?? false;
  token = CacheHelper.getData(key: "token");
  nationalId = CacheHelper.getData(key: "userId");
  if (boarding) {
    nextScreen = SignInScreen();
  } else {
    nextScreen = const OnboardingScreen();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'e commerce training',
        theme: lightTheme,
        darkTheme: ThemeData.dark(),
        home: nextScreen,
      ),
    );
  }
}
