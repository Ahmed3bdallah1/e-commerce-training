abstract class RegisterState {}

class InitialStateRegister extends RegisterState {}

class DoneStateRegister extends RegisterState {}

class ErrorStateRegister extends RegisterState {
  String error;

  ErrorStateRegister(this.error);
}

class ChooseImageStateRegister extends RegisterState {}

class UploadErrorMessageRegisterState extends RegisterState {
  String error;

  UploadErrorMessageRegisterState(this.error);
}
