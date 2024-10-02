import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/watch_list/pesentation/manager/watch_list_cubit/watch_list_cubit.dart';
import 'package:movies_app/features/watch_list/pesentation/views/widgets/watch_list_view_item.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<WatchListCubit, WatchListState>(
        builder: (context, state) {
          return ListView.separated(
            separatorBuilder: (buildContext, index) => Container(
              margin: const EdgeInsets.only(
                left: 2,
                right: 2,
                top: 18,
                bottom: 18,
              ),
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            itemCount: context.read<WatchListCubit>().watchList.length,
            itemBuilder: (buildContext, index) {
              return WatchListViewItem(
                movieResult: context.read<WatchListCubit>().watchList[index],
              );
            },
          );
        },
      ),
    );
  }
}
