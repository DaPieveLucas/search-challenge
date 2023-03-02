import 'package:flutter/material.dart';

import '../cubit/cubit/searchs_cubit.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar(
      {required this.searchCubit, required this.searchController, super.key});

  final TextEditingController searchController;
  final SearchsCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            searchController.clear();
          },
          icon: const Icon(Icons.close)),
      backgroundColor: Colors.blue[600],
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      actions: [
        IconButton(
            onPressed: () {
              searchCubit.postGoogleSearch(query: searchController.text);
            },
            icon: const Icon(Icons.search))
      ],
      title: TextField(
        controller: searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          hintText: 'Type your search here...',
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
