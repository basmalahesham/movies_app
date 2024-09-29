part of 'similar_movies_cubit.dart';

@immutable
sealed class SimilarMoviesState {}

final class SimilarMoviesInitial extends SimilarMoviesState {}
final class SimilarMoviesLoading extends SimilarMoviesState {}

final class SimilarMoviesSuccess extends SimilarMoviesState {
  final MovieModel movieModel;

  SimilarMoviesSuccess(this.movieModel);
}

final class SimilarMoviesFailure extends SimilarMoviesState {
  final String errMessage;

  SimilarMoviesFailure(this.errMessage);
}