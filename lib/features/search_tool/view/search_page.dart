import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:search_challenge/features/search_tool/model/search_link_model.dart';

import '../../../app/constants/app_constants.dart';
import '../cubit/cubit/searchs_cubit.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: TextField(
      //     controller: _controller,
      //     decoration: InputDecoration(
      //       hintText: 'Search',
      //       border: UnderlineInputBorder(
      //         borderRadius: BorderRadius.circular(10.0),
      //         borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
      //       ),
      //     ),
      //     onChanged: (query) {
      //       context.read<SearchsCubit>().fetchGoogleSearch(int.parse(query));
      //     },
      //   ),
      //   centerTitle: true,
      // ),
      body: BlocBuilder<SearchsCubit, SearchsCubitState>(
        builder: (context, state) {
          if (state is SearchsCubitLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is SearchsCubitError) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is SearchsCubitSuccess) {
            return Center(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () => context
                          .read<SearchsCubit>()
                          .postGoogleSearch(query: 'globo esporte'),
                      child: Text('make request')),
                  Text(state.link)
                ],
              ),
            );
          } else {
            return Center(
              child: ElevatedButton(
                  onPressed: () => context
                      .read<SearchsCubit>()
                      .postGoogleSearch(query: 'globo esporte'),
                  child: Text('make request')),
            );

            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: SingleChildScrollView(
            //     child: SizedBox(
            //       height: MediaQuery.of(context).size.height,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           SvgPicture.asset(
            //             AppConstants.searchImage,
            //             height: 250,
            //           ),
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           const Text(
            //             'Please make your search on the AppBar',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // );
          }
        },
      ),
    );
  }
}
