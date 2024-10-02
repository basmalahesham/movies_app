part of 'watch_list_cubit.dart';

@immutable
sealed class WatchListState {
  final List<Results> watchList;
  final List<int> idList;

  const WatchListState({required this.watchList, required this.idList});
}

final class WatchListInitial extends WatchListState {
  const WatchListInitial({required super.watchList, required super.idList});
}

final class WatchListChanged extends WatchListState {
  const WatchListChanged({required super.watchList, required super.idList});
}
