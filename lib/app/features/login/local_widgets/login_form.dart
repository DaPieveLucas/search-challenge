import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../search_tool/view/search_page.dart';
import '../cubit/login_cubit.dart';
import 'email_input_field.dart';
import 'password_input_field.dart';

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
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SearchPage()));
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
                const SizedBox(
                  height: 10,
                ),
                PasswordInputField(
                  passwordTextController: _passwordController,
                  passValidationCubit: (value) => context
                      .read<LoginCubit>()
                      .passwordValidator(_passwordController.text),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 290.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    onPressed: state.isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              widget.loginCubit.login(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                            }
                          },
                    child: state.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(fontSize: 15),
                          ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
