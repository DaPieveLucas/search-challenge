import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login({String? email, String? password}) async {
    try {
      emit(state.copyWith(isLoading: true));

      if (email == 'lucas@gmail.com' && password == '123456') {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, isFailure: true));
    }
  }

  String emailValidator(String? emValue) {
    if (emValue == null || emValue.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emValue)) {
      return 'Please enter a valid email';
    }
    return '';
  }

  passwordValidator(String? passValue) {
    if (passValue == null || passValue.isEmpty) {
      return 'Please enter a password';
    } else if (passValue.length < 5) {
      return 'Password must be at least 6 characters long';
    }
    return '';
  }
}
