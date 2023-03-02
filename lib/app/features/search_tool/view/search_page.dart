import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_constants.dart';
import '../cubit/cubit/searchs_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  late SearchsCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = context.read<SearchsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                _cubit.postGoogleSearch(query: _controller.text);
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Sorry, we have encountered an error'),
                  Icon(
                    Icons.close,
                    size: 50,
                  )
                ],
              ),
            );
          } else if (state is SearchsCubitSuccess) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5, color: Colors.blueAccent),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          state.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => _cubit.setLaunchUrl(state.link),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent),
                      child: const Text(
                        'I am feeling lucky',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
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
