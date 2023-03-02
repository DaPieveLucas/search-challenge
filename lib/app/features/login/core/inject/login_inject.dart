import 'package:get_it/get_it.dart';

import '../../cubit/login_cubit.dart';

class LoginInject {
  loginInject(GetIt getIt) {
    getIt.registerFactory<LoginCubit>(() => LoginCubit());
  }
}
