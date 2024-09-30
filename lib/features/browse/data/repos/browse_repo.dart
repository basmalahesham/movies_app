import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/browse/data/models/genre_model.dart';

abstract class BrowseRepo {
  Future<Either<Failure, GenreModel>> fetchGenre();
  Future<Either<Failure, GenreModel>> fetchMoviesList();
}
