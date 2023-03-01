import 'package:get_it/get_it.dart';
import 'package:search_challenge/features/login/cubit/login_cubit.dart';

class LoginInject {
  loginInject(GetIt getIt) {
    getIt.registerFactory<LoginCubit>(() => LoginCubit());
  }
}
