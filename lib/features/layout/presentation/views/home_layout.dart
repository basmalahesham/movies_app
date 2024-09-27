import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/generated/assets.dart';
import 'package:movies_app/features/browse/browse_view.dart';
import 'package:movies_app/features/home/presentation/views/home_view.dart';
import 'package:movies_app/features/search/pesentation/views/search_view.dart';
import 'package:movies_app/features/watch_list/pesentation/views/watch_list_view.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  static const String routeName = "home_layout";
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const BrowseView(),
    const WatchListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromRGBO(26, 26, 26, 1.0),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.imagesIcHome)),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.imagesIcSearch)),
              label: 'SEARCH',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.imagesIcBrowse)),
              label: 'BROWSE',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.imagesIcWatchList)),
              label: 'WATCHLIST',
            ),
          ],
        ),
      ),
    );
  }
}
