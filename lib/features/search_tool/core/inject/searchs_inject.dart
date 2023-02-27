import 'package:get_it/get_it.dart';

import '../../../../app/services/api_service.dart';
import '../../cubit/cubit/searchs_cubit.dart';

class SearchsInject {
  searchsInject(GetIt getIt) {
    getIt.registerFactory<SearchsCubit>(
        () => SearchsCubit(client: getIt.get<ApiService>()));

    getIt.registerFactory<ApiService>(() => ApiService());
  }
}
