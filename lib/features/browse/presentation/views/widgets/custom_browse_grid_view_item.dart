import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/presentation/views/browse_list_view.dart';

class CustomBrowseGridViewItem extends StatelessWidget {
  const CustomBrowseGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, BrowseListView.routeName);
      },
      child: SizedBox(
        width: 160.0,
        height: 90.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/image_cat.png'),
            ),
          ),
          child: const Center(
            child: Text(
              'Action',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
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
