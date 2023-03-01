import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_challenge/features/login/cubit/login_cubit.dart';
import 'package:search_challenge/features/login/local_widgets/password_input_field.dart';

import '../../search_tool/view/search_page.dart';
import 'email_input_field.dart';

class LoginForm extends StatefulWidget {
  final LoginCubit loginCubit;

  const LoginForm({required this.loginCubit, super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        } else if (state.isLoading) {
          const CircularProgressIndicator.adaptive();
        } else if (state.isFailure) {
          const Center(
            child: Text('failed to make login'),
          );
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                EmailInputField(
                  emailTextController: _emailController,
                  emaValidationCubit: (value) => context
                      .read<LoginCubit>()
                      .emailValidator(_emailController.text),
                ),
                PasswordInputField(
                  passwordTextController: _passwordController,
                  passValidationCubit: (value) => context
                      .read<LoginCubit>()
                      .passwordValidator(_passwordController.text),
                ),
                SizedBox(
                  width: 290.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent),
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 15),
                      )),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
