import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/browse/data/models/genre_model.dart';
import 'package:movies_app/features/browse/presentation/manager/movies_list_cubit/movies_list_cubit.dart';
import 'package:movies_app/features/browse/presentation/views/widgets/custom_browse_list_view_separated.dart';

class BrowseListViewBody extends StatelessWidget {
  const BrowseListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Genres;
    BlocProvider.of<MoviesListCubit>(context)
        .fetchMoviesList(categoryName: args.name??'');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF1D1E1D),
        title:  Text(
          '${args.name} List',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBrowseListViewSeparated(),
          ],
        ),
      ),
    );
  }
}
