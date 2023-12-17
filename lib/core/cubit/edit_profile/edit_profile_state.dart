abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class SuccessEditProfile extends EditProfileState {}

class ErrorEditProfile extends EditProfileState {
  final String error;

  ErrorEditProfile({required this.error});
}
