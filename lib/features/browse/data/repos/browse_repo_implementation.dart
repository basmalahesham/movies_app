import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/browse/data/models/genre_model.dart';
import 'package:movies_app/features/browse/data/repos/browse_repo.dart';

class BrowseRepoImplementation implements BrowseRepo{
  @override
  Future<Either<Failure, GenreModel>> fetchGenre() {
    // TODO: implement fetchGenre
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GenreModel>> fetchMoviesList() {
    // TODO: implement fetchMoviesList
    throw UnimplementedError();
  }

}