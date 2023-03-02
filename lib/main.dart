import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_challenge/app/core/inject.dart';

import 'app/features/login/cubit/login_cubit.dart';
import 'app/features/login/view/login_page.dart';
import 'app/features/search_tool/cubit/cubit/searchs_cubit.dart';

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
          ),
          BlocProvider<LoginCubit>(
            create: (context) => getIt<LoginCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Search Challenge',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
        ));
  }
}
