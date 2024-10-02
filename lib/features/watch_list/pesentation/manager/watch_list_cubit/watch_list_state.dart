part of 'watch_list_cubit.dart';

@immutable
sealed class WatchListState {}

final class WatchListInitial extends WatchListState {}

final class WatchListChanged extends WatchListState {}
