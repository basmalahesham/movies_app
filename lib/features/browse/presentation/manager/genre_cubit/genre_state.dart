part of 'genre_cubit.dart';

@immutable
sealed class GenreState {}

final class GenreInitial extends GenreState {}

final class GenreLoading extends GenreState {}

final class GenreSuccess extends GenreState {
  final GenreModel genreModel;

  GenreSuccess(this.genreModel);
}

final class GenreFailure extends GenreState {
  final String errMessage;

  GenreFailure(this.errMessage);
}
