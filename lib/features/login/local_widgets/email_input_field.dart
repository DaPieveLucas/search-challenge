import 'package:flutter/material.dart';

import 'package:search_challenge/features/login/local_widgets/auth_text_field.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField(
      {required this.emaValidationCubit,
      required this.emailTextController,
      super.key});

  final TextEditingController emailTextController;
  final String? Function(String?)? emaValidationCubit;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      formValidator: emaValidationCubit,
      keyboardType: TextInputType.emailAddress,
      hint: 'Email',
      isRequiredField: true,
      icon: Icons.email_outlined,
      textController: emailTextController,
    );
  }
}
