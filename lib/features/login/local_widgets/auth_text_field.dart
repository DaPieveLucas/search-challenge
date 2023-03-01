import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hint;

  final TextInputType keyboardType;
  final bool isPasswordField;
  final bool isRequiredField;
  final String? error;
  final EdgeInsets padding;
  final IconData icon;
  final TextEditingController textController;
  final String? Function(String?)? formValidator;

  const AuthTextField({
    Key? key,
    this.hint = '',
    required this.keyboardType,
    required this.icon,
    required this.textController,
    required this.formValidator,
    this.isPasswordField = false,
    this.isRequiredField = false,
    this.error,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder border = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2));
    UnderlineInputBorder errorBorder = const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 2));
    return Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.blue[900],
            ),
            SizedBox(
              width: 250,
              child: TextFormField(
                controller: textController,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  fillColor: Colors.grey[250],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  filled: true,
                  hintText: isRequiredField ? '$hint*' : hint,
                  border: border,
                  disabledBorder: border,
                  enabledBorder: border,
                  errorBorder: errorBorder,
                  focusedErrorBorder: errorBorder,
                  errorText: error,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                autocorrect: false,
                textInputAction: TextInputAction.done,
                obscureText: isPasswordField,
                maxLines: 1,
                validator: formValidator,
              ),
            )
          ],
        ));
  }
}
