import 'package:flutter/material.dart';
import 'package:search_challenge/features/login/local_widgets/auth_text_field.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField(
      {required this.passValidationCubit,
      required this.passwordTextController,
      super.key});

  final TextEditingController passwordTextController;
  final String? Function(String?)? passValidationCubit;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      formValidator: passValidationCubit,
      keyboardType: TextInputType.text,
      hint: 'Password',
      isPasswordField: true,
      isRequiredField: true,
      icon: Icons.password_outlined,
      textController: passwordTextController,
    );
  }
}
