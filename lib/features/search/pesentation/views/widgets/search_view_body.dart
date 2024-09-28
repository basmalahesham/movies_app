import 'package:flutter/material.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController textController = TextEditingController();
  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
            height: 48,
            child: TextFormField(
              // controller: textController,
              onChanged: (value) {
                searchKey = value;
                setState(() {});
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(81, 79, 79, 1.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                ),
                hintText: 'search',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          searchKey.isNotEmpty
              ? const SizedBox()
              : const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_movies,
                        color: Color.fromRGBO(181, 180, 180, 1.0),
                        size: 150,
                      ),
                      Text(
                        'No movies found',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(181, 180, 180, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
