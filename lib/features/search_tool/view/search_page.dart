import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit/searchs_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
            ),
            onChanged: (query) {
              context.read<SearchsCubit>().fetchGoogleSearch(int.parse(query));
            },
          ),
        ),
        body: BlocBuilder<SearchsCubit, SearchsCubitState>(
          builder: (context, state) {
            if (state is SearchsCubitLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is SearchsCubitError) {
              return Center(
                child: Icon(Icons.close),
              );
            } else if (state is SearchsCubitSuccess) {
              return ListView.builder(
                itemCount: state.searchs.length,
                itemBuilder: (context, index) {
                  final result = state.searchs[index];
                  return ListTile(
                    title: Text(result.firstName ?? 'problem to get data'),
                    subtitle: Text(result.lastName ?? 'problem to get data'),
                  );
                },
              );
            } else {
              return Center(
                child: Container(
                  height: 10,
                  width: 10,
                  color: Colors.amber,
                ),
              );
            }
          },
        )

        // BlocBuilder<SearchCubit, List<SearchLinkModel>>(
        //   builder: (context, state) {
        //     if (state.isEmpty) {
        //       return const Center(
        //         child: Text('No results'),
        //       );
        // } else {
        //   return ListView.builder(
        //     itemCount: state.length,
        //     itemBuilder: (context, index) {
        //       final result = state[index];
        //       return ListTile(
        //         title: Text(result.firstName ?? 'problem to get data'),
        //         subtitle: Text(result.lastName ?? 'problem to get data'),
        //       );
        //     },
        //   );
        // }
        //   },
        // ),
        );
  }
}
