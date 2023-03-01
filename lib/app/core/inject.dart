import 'package:get_it/get_it.dart';
import 'package:search_challenge/features/login/core/inject/login_inject.dart';

import '../../features/search_tool/core/inject/searchs_inject.dart';

final GetIt getIt = GetIt.instance;

class Inject {
  Inject._();

  static Future<void> init() async {
    SearchsInject().searchsInject(getIt);
    LoginInject().loginInject(getIt);
  }
}
