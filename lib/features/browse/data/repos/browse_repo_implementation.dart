import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/browse/data/models/genre_model.dart';
import 'package:movies_app/features/browse/data/repos/browse_repo.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

class BrowseRepoImplementation implements BrowseRepo{
  final ApiService apiService;

  BrowseRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, GenreModel>> fetchGenre() async{
    try {
      var data = await apiService.get(endpoint: 'genre/movie/list');
      var result = GenreModel.fromJson(data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }

  }

  @override
  Future<Either<Failure, MovieModel>> fetchMoviesList() async{
    try {
      var data = await apiService.get(endpoint: 'discover/movie');
      var result = MovieModel.fromJson(data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

}