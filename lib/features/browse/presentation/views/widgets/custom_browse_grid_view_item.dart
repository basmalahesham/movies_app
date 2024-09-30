import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/data/models/genre_model.dart';
import 'package:movies_app/features/browse/presentation/views/browse_list_view.dart';

class CustomBrowseGridViewItem extends StatelessWidget {
  const CustomBrowseGridViewItem({super.key, required this.genreModel});
  final Genres genreModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          BrowseListView.routeName,
          arguments: genreModel,
        );
      },
      child: SizedBox(
        width: 160.0,
        height: 90.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/proxy-image.jpg'),
            ),
          ),
          child: Center(
            child: Text(
              genreModel.name ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        /*Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/image_cat.png'),
            ),
            const Text(
              'Action',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),*/
      ),
    );
  }
}
