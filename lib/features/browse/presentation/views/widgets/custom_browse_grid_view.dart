import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/widgets/custom_error_widget.dart';
import 'package:movies_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:movies_app/features/browse/presentation/manager/genre_cubit/genre_cubit.dart';
import 'package:movies_app/features/browse/presentation/views/widgets/custom_browse_grid_view_item.dart';

class CustomBrowseGridView extends StatelessWidget {
  const CustomBrowseGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreCubit, GenreState>(
      builder: (context, state) {
        if (state is GenreSuccess) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 3 / 2,
              ),
              itemCount: state.genreModel.genres!.length,
              itemBuilder: (context, index) {
                return CustomBrowseGridViewItem(
                  genreModel: state.genreModel.genres![index],
                );
              },
            ),
          );
        } else if (state is GenreFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
