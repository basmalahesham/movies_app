import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/watch_list/pesentation/manager/watch_list_cubit/watch_list_cubit.dart';
import 'package:movies_app/features/watch_list/pesentation/views/widgets/no_movies_select.dart';
import 'package:movies_app/features/watch_list/pesentation/views/widgets/watch_list_view.dart';

class WatchViewBody extends StatelessWidget {
  const WatchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Watchlist',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          context.read<WatchListCubit>().idList.isNotEmpty
              ? const WatchListView()
              : const NoMoviesSelect(),
        ],
      ),
    );
  }
}
