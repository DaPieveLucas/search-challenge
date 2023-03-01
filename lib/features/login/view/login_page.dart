import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:search_challenge/features/login/cubit/login_cubit.dart';

import '../../../app/constants/app_constants.dart';
import '../local_widgets/login_form.dart';

//transformar em stf
class LoginPage extends StatelessWidget {
  const LoginPage({required this.cubit, super.key});

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AppConstants.loginImage,
                  height: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                LoginForm(loginCubit: cubit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
