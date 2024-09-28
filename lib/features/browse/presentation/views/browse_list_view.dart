import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/presentation/views/widgets/browse_list_view_body.dart';

class BrowseListView extends StatelessWidget {
  const BrowseListView({
    super.key,
  });
  static const String routeName = 'browse_list_view';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: BrowseListViewBody(),
    );
  }
}
