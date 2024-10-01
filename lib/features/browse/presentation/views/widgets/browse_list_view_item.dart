import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/presentation/views/movie_details_view.dart';

class BrowseListViewItem extends StatelessWidget {
  const BrowseListViewItem({
    super.key,
    required this.movieModel,
  });
  final Results movieModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MovieDetailsView.routeName,
                    arguments: movieModel,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500'
                    '${movieModel.posterPath}',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 100,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset('assets/images/ic_bookmark.png'),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  movieModel.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  movieModel.releaseDate ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  movieModel.overview ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
