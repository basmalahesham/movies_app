import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:movies_app/features/search/pesentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/pesentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SearchCubit(
          getIt.get<SearchRepoImplementation>(),
        ),
        child: const SearchViewBody(),
      ),
    );
  }
}
