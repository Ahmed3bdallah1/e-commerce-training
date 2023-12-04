abstract class SignInState {}

class InitialStateSignIn extends SignInState {}

class DoneStateSignIn extends SignInState {}

class ErrorStateSignIn extends SignInState {
  String error;

  ErrorStateSignIn(this.error);
}
