import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_challenge/app/core/inject.dart';

import '../features/search_tool/cubit/cubit/searchs_cubit.dart';
// import '../features/search_tool/cubit/search_cubit.dart';
import '../features/search_tool/view/search_page.dart';

void main() async {
  await Inject.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SearchsCubit>(
            create: (context) => getIt<SearchsCubit>(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SearchPage(),
        ));
  }
}
