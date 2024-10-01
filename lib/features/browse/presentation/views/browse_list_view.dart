import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/browse/data/repos/browse_repo_implementation.dart';
import 'package:movies_app/features/browse/presentation/manager/movies_list_cubit/movies_list_cubit.dart';
import 'package:movies_app/features/browse/presentation/views/widgets/browse_list_view_body.dart';

class BrowseListView extends StatelessWidget {
  const BrowseListView({
    super.key,
  });

  static const String routeName = 'browse_list_view';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => MoviesListCubit(
          getIt.get<BrowseRepoImplementation>(),
        ),
        child: const BrowseListViewBody(),
      ),
    );
  }
}
