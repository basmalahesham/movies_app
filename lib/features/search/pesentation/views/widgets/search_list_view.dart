import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/widgets/custom_error_widget.dart';
import 'package:movies_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:movies_app/features/search/pesentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/pesentation/views/widgets/search_list_view_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return SearchListViewItem(
                    movieResponse: state.movieModel.results![index],);
              },
              separatorBuilder: (BuildContext context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                      left: 2, right: 2, top: 18, bottom: 18),
                  width: double.infinity,
                  height: 1,
                  color: const Color.fromRGBO(181, 180, 180, 1.0),
                );
              },
              itemCount: state.movieModel.results!.length,
            ),
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }

  // List loadSearchData(context) {
  //   BlocProvider.of<SearchCubit>(context).fetchSearch(query: searchKey).then((value){
  //     result = value.results ?? [];
  //   });
  //   ApiRepository.fetchSearch(searchKey).then((value) {
  //     result = value.results ?? [];
  //   }).onError((error, stackTrace) {
  //     print('error => ${error.toString()}');
  //   });
  //   return result;
  // }
}
