import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this.homeRepo) : super(TopRatedMoviesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchTopRatedMovie() async {
    emit(TopRatedMoviesLoading());
    var result = await homeRepo.fetchPopularMovie();
    result.fold(
      (failure) => emit(
        TopRatedMoviesFailure(failure.errMessage),
      ),
      (movies) => emit(
        TopRatedMoviesSuccess(movies),
      ),
    );
  }
}
