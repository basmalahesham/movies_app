import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(const WatchListInitial(watchList: [], idList: []));

  void selectMovie(Results resultsMovie) {
    final currentIdList = List<int>.from(state.idList);
    final currentWatchList = List<Results>.from(state.watchList);

    if (!currentIdList.contains(resultsMovie.id)) {
      currentWatchList.add(resultsMovie);
      currentIdList.add(resultsMovie.id!);
      emit(
          WatchListChanged(watchList: currentWatchList, idList: currentIdList));
    } else {
      currentIdList.remove(resultsMovie.id);
      currentWatchList.removeWhere((element) => element.id == resultsMovie.id);
      emit(
          WatchListChanged(watchList: currentWatchList, idList: currentIdList));
    }
  }
}
