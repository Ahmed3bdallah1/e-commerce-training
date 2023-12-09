abstract class FavoriteState {}

class InitialFavoriteState extends FavoriteState {}

class AddToFavoriteState extends FavoriteState {}

class ErrorAddToFavoriteState extends FavoriteState {
  final String error;

  ErrorAddToFavoriteState({required this.error});
}

class GetFavoriteState extends FavoriteState {}

class ErrorGetFavoriteState extends FavoriteState {
  final String error;

  ErrorGetFavoriteState({required this.error});
}

class DeleteFavoriteState extends FavoriteState {}

class ErrorDeleteFavoriteState extends FavoriteState {
  final String error;

  ErrorDeleteFavoriteState({required this.error});
}
