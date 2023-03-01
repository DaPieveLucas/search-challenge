import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/constants/app_constants.dart';
import '../cubit/cubit/searchs_cubit.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                context
                    .read<SearchsCubit>()
                    .postGoogleSearch(query: _controller.text);
              },
              icon: const Icon(Icons.search))
        ],
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search',
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SearchsCubit, SearchsCubitState>(
        builder: (context, state) {
          if (state is SearchsCubitLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is SearchsCubitError) {
            return Center(
              child: Column(
                children: const [
                  Text('Sorry, we have encoutered an error'),
                  Icon(
                    Icons.close,
                    size: 50,
                  )
                ],
              ),
            );
          } else if (state is SearchsCubitSuccess) {
            return Center(
              child: Column(
                children: [
                  Text(state.title),
                  Text(state.link),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppConstants.searchImage,
                        height: 250,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Please make your search on the AppBar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
