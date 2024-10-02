import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/browse/presentation/views/browse_list_view.dart';
import 'package:movies_app/features/home/presentation/views/movie_details_view.dart';
import 'package:movies_app/features/layout/presentation/views/home_layout.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';
import 'package:movies_app/features/watch_list/pesentation/manager/watch_list_cubit/watch_list_cubit.dart';


void main() {
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchListCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyThemeData.defaultTheme,
        initialRoute: SplashView.routeName,
        routes: {
          SplashView.routeName: (context) => const SplashView(),
          HomeLayout.routeName: (context) => const HomeLayout(),
          MovieDetailsView.routeName: (context) => const MovieDetailsView(),
          BrowseListView.routeName: (context) => const BrowseListView(),
        },
      ),
    );
  }
}
