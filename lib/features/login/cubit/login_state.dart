part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;

  const LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  @override
  List<Object?> get props => [isLoading, isSuccess, isFailure];

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
