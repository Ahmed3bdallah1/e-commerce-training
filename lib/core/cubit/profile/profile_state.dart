abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GotProfileInfoState extends ProfileState {}

class ErrorProfileState extends ProfileState {
  final String error;

  ErrorProfileState({required this.error});
}

class UpdateProfileDataState extends ProfileState {}

class ErrorUpdateProfileDataState extends ProfileState {
  final String error;

  ErrorUpdateProfileDataState({required this.error});
}
