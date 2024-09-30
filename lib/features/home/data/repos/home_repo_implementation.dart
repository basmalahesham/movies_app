import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, MovieModel>> fetchLatestMovie() async{
    try {
      var data = await apiService.get(endpoint: 'movie/latest');
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

  @override
  Future<Either<Failure, MovieModel>> fetchPopularMovie() async {
    try {
      var data = await apiService.get(endpoint: 'movie/popular');
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

  @override
  Future<Either<Failure, MovieModel>> fetchTopRatedMovie() async{
    try {
      var data = await apiService.get(endpoint: 'movie/top_rated');
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

  @override
  Future<Either<Failure, MovieModel>> fetchSimilarMovie({required int movieId}) async{
    try {
      var data = await apiService.get(endpoint: 'movie/$movieId/similar');
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
