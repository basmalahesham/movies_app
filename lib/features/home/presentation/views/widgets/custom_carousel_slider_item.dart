import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/generated/assets.dart';

class CustomCarouselSliderItem extends StatelessWidget {
  const CustomCarouselSliderItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.30,
      margin: const EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.22,
            child: Stack(
              children: [
                Image.asset(
                  Assets.imagesImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.center,
                  // left: size.width * 0.40,
                  // top: size.height * 0.09,
                  child: IconButton(
                    onPressed: (){},
                    icon: const Icon(
                      Icons.play_circle_filled,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: size.width * 0.05,
            top: size.height * 0.06,
            child: Row(
              children: [
                SizedBox(
                  width: 130,
                  height: 300,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          Assets.imagesItemImage,
                          fit: BoxFit.cover,
                          width: 130,
                          height: 200,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child:
                          Image.asset('assets/images/ic_bookmark.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'resultResponse!.title',
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'resultResponse!.releaseDate',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(181, 180, 180, 1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
