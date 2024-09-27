import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/generated/assets.dart';

class CustomMovieImage extends StatelessWidget {
  const CustomMovieImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              Assets.imagesItemImage,
              fit: BoxFit.cover,
              width: 110,
              height: 130,
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
    );
  }
}
