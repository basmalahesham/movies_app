import 'package:flutter/material.dart';
import 'package:movies_app/features/watch_list/pesentation/views/widgets/watch_view_body.dart';

class WatchView extends StatelessWidget {
  const WatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: WatchViewBody(),
    );
  }
}
