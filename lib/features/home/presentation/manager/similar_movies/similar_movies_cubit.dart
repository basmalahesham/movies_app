import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit(this.homeRepo) : super(SimilarMoviesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarMovie({required int movieId}) async {
    emit(SimilarMoviesLoading());
    var result = await homeRepo.fetchSimilarMovie(movieId: movieId);
    result.fold(
          (failure) => emit(
        SimilarMoviesFailure(failure.errMessage),
      ),
          (movies) => emit(
        SimilarMoviesSuccess(movies),
      ),
    );
  }
}
