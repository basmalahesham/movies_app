import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(WatchListInitial());
  List<Results> watchList = [];
  List<int> idList = [];

  void selectMovie(Results resultsMovie) {
    //final currentIdList = List<int>.from(idList);
    //final currentWatchList = List<Results>.from(watchList);

    if (!idList.contains(resultsMovie.id)) {
      watchList.add(resultsMovie);
      idList.add(resultsMovie.id!);
      emit(WatchListChanged());
    } else {
      idList.remove(resultsMovie.id);
      watchList.removeWhere((element) => element.id == resultsMovie.id);
      emit(WatchListChanged());
    }
  }
}
