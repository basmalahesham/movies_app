import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/widgets/custom_error_widget.dart';
import 'package:movies_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:movies_app/features/browse/presentation/manager/movies_list_cubit/movies_list_cubit.dart';
import 'package:movies_app/features/browse/presentation/views/widgets/browse_list_view_item.dart';

class CustomBrowseListViewSeparated extends StatelessWidget {
  const CustomBrowseListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListCubit, MoviesListState>(
      builder: (context, state) {
        if (state is MoviesListSuccess) {
          return Expanded(
            child: ListView.separated(
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
              itemCount: state.movieModel.results!.length,
              itemBuilder: (buildContext, index) {
                return BrowseListViewItem(
                  movieModel: state.movieModel.results![index],
                );
              },
            ),
          );
        } else if (state is MoviesListFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
