import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../data/http/http.dart';
import '../../data/repositories/repositories.dart';
import '../../domain/repositories/repositories.dart';
import '../../viewmodels/viewmodels.dart';
import '../factories/http/http.dart';
import '../routes.dart';

export 'di_usecases.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<MyHttpClient>(makeDioAdapter);
  getIt.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(getIt<MyHttpClient>()));
  getIt.registerLazySingleton<GoRouter>(() => AppRouter.routerConfig);
  getIt.registerFactory<SplashViewModel>(SplashViewModel.new);
}
