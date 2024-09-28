import 'package:flutter/material.dart';

class NoMoviesSelect extends StatelessWidget {
  const NoMoviesSelect({
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
            'No movies select yet.',
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
