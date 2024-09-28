import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.homeRepo) : super(PopularMoviesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchPopularMovie() async {
    emit(PopularMoviesLoading());
    var result = await homeRepo.fetchPopularMovie();
    result.fold(
      (failure) => emit(
        PopularMoviesFailure(failure.errMessage),
      ),
      (movies) => emit(
        PopularMoviesSuccess(movies),
      ),
    );
  }
}
