// ignore: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login({String? email, String? password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      emit(state.copyWith(isLoading: true));

      if (email == 'umbler' && password == 'testehospedagem') {
        prefs.setString('email', '$email');
        prefs.setString('password', '$password');

        emit(state.copyWith(isLoading: false, isSuccess: true));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, isFailure: true));
    }
  }

  String? emailValidator(String? emValue) {
    if (emValue == null || emValue.isEmpty) {
      return 'Please enter an email address';
    }
    return null;
  }

  String? passwordValidator(String? passValue) {
    if (passValue == null || passValue.isEmpty) {
      return 'Please enter a password';
    } else if (passValue.length < 15) {
      return 'Password must be at least 16 characters long';
    }
    return null;
  }
}
