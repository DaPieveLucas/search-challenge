import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/app_constants.dart';
import '../cubit/login_cubit.dart';
import '../local_widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = context.read<LoginCubit>();
  }

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
                LoginForm(loginCubit: _cubit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
