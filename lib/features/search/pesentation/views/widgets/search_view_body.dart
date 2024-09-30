import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/search/pesentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/pesentation/views/widgets/no_movies_found.dart';
import 'package:movies_app/features/search/pesentation/views/widgets/search_list_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController textController = TextEditingController();
  String searchKey = '';
  List<Results> result = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
          height: 48,
          child: TextField(
            // controller: textController,
            onChanged: (value) {
              setState(() {
                searchKey = value;
                if (searchKey.isNotEmpty) {
                  // Trigger the search when the user types
                  BlocProvider.of<SearchCubit>(context)
                      .fetchSearch(query: searchKey);
                }
              });
            },
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: const Color.fromRGBO(81, 79, 79, 1.0),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              enabled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 24,
              ),
              hintText: 'search',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        searchKey.isNotEmpty ? const SearchListView() : const NoMoviesFound(),
      ],
    );
  }
}
