import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/browse/data/repos/browse_repo_implementation.dart';
import 'package:movies_app/features/browse/presentation/manager/genre_cubit/genre_cubit.dart';
import 'package:movies_app/features/browse/presentation/views/widgets/browse_view_body.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => GenreCubit(
          getIt.get<BrowseRepoImplementation>(),
        )..fetchGenre(),
        child: const BrowseViewBody(),
      ),
    );
  }
}
