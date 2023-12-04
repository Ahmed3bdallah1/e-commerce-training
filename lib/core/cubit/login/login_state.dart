import 'package:e_commerce_training/models/user/user_model.dart';

abstract class SignInState {}

class InitialStateSignIn extends SignInState {}

class DoneStateSignIn extends SignInState {
  final UserModel model;
  DoneStateSignIn(this.model);
}

class ErrorStateSignIn extends SignInState {
  String error;

  ErrorStateSignIn(this.error);
}
