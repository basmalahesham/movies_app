import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/generated/assets.dart';
import 'package:movies_app/features/home/presentation/views/widgets/more_movies_list_view.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF1D1E1D),
        title: const Text(
          'Dora and the lost city of gold',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
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
                            child: IconButton(
                              onPressed: () {},
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
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dora and the lost city of gold',
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '2019  PG-13  2h 7m',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(181, 180, 180, 1.0),
                            ),
                          ),
                          // PopularItem(movies),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 190,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
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
                                child: Image.asset(
                                    'assets/images/ic_bookmark.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // PopularItem(movies),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Padding(
                              // No attribute in the API refers to movie Type !!!!!!!!!!!!!!!!
                              // No attribute in the API refers to movie Type !!!!!!!!!!!!!!!!
                              // No attribute in the API refers to movie Type !!!!!!!!!!!!!!!!
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Action',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ',
                              style: TextStyle(color: Colors.white,fontSize: 13),
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '7.7',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const MoreMoviesListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
