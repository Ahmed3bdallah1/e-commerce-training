import 'package:e_commerce_training/models/user/user_model.dart';

abstract class RegisterState {}

class InitialStateRegister extends RegisterState {}

class DoneStateRegister extends RegisterState {
  final UserModel model;

  DoneStateRegister(this.model);
}

class ErrorStateRegister extends RegisterState {
  String error;

  ErrorStateRegister(this.error);
}

class ChooseImageStateRegister extends RegisterState {}

class UploadErrorMessageRegisterState extends RegisterState {
  String error;

  UploadErrorMessageRegisterState(this.error);
}
