import 'package:e_commerce_training/core/cubit/login/login_cubit.dart';
import 'package:e_commerce_training/core/cubit/login/login_state.dart';
import 'package:e_commerce_training/screens/modules/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/managers/constants_colors.dart';
import '../../core/managers/navigation.dart';
import '../../core/managers/values.dart';
import '../../core/network/local/cache_helper.dart';
import 'home_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  ConstantsColors colors = ConstantsColors();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is DoneStateSignIn) {
            if (state.model.status == "success") {
              print(state.model.message);
              CacheHelper.saveData(
                  key: "userId", value: state.model.user!.nationalId)
                  .then((value) {
                nationalId = state.model.user!.nationalId;
              });
              CacheHelper.saveData(key: "token", value: state.model.user!.token)
                  .then((value) {
                token = state.model.user!.token;
                navigateAndFinishThisScreen(context, const HomeScreen());
              });
            } else {
              print(state.model.message);
            }
          }
        },
        builder: (context, state) {
          SignInCubit cubit = SignInCubit.get(context);
          return Scaffold(
            backgroundColor: colors.primarySecondColor.withOpacity(.1),
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: const Text('Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(
                width: size.width * .95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: colors.linearGradientPeace,
                  boxShadow: [
                    BoxShadow(
                        color: colors.primarySecondColor.withOpacity(.3),
                        spreadRadius: 5,
                        blurRadius: 4,
                        offset: const Offset(0, 5)),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                  controller: _emailController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      labelText: "email",
                                      filled: true,
                                      labelStyle: TextStyle(
                                          color: Colors.black.withOpacity(.2)),
                                      prefixIcon: const Icon(
                                        Icons.email_outlined,
                                        color: Colors.black,
                                      ),
                                      fillColor: Colors.white.withOpacity(.5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter an email';
                                    }
                                    return null;
                                  })),
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                  controller: _passwordController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      labelText: "password",
                                      labelStyle: TextStyle(
                                          color: Colors.black.withOpacity(.2)),
                                      filled: true,
                                      prefixIcon: const Icon(
                                        Icons.password,
                                        color: Colors.black,
                                      ),
                                      fillColor: Colors.white.withOpacity(.5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.isEmpty || value.length <= 6) {
                                      return 'password must be 6 characters';
                                    }
                                    return null;
                                  })),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.userLogin(
                                        context,
                                        _emailController.text,
                                        _passwordController.text);
                                  }
                                },
                                child: const Text('Sign In')),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("you don't have an account? ",
                                    style: TextStyle(color: Colors.black)),
                                GestureDetector(
                                    onTap: () {
                                      navigateAndReplace(
                                          context, RegisterScreen());
                                    },
                                    child: const Text("Register",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey)))
                              ])
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
