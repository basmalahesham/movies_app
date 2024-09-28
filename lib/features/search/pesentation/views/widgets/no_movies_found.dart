import 'package:flutter/material.dart';

class NoMoviesFound extends StatelessWidget {
  const NoMoviesFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_movies,
            color: Color.fromRGBO(181, 180, 180, 1.0),
            size: 150,
          ),
          Text(
            'No movies found',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(181, 180, 180, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
