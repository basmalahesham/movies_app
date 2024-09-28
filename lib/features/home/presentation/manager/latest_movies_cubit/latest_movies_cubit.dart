import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

part 'latest_movies_state.dart';

class LatestMoviesCubit extends Cubit<LatestMoviesState> {
  LatestMoviesCubit(this.homeRepo) : super(LatestMoviesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchLatestMovie() async {
    emit(LatestMoviesLoading());
    var result = await homeRepo.fetchPopularMovie();
    result.fold(
          (failure) => emit(
        LatestMoviesFailure(failure.errMessage),
      ),
          (movies) => emit(
        LatestMoviesSuccess(movies),
      ),
    );
  }
}
