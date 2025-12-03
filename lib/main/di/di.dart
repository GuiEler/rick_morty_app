import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../data/http/http.dart';
import '../../data/repositories/repositories.dart';
import '../../domain/repositories/repositories.dart';
import '../../view_model/view_model.dart';
import '../factories/http/http.dart';
import '../routes.dart';

export 'di_usecases.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<GoRouter>(() => AppRouter.routerConfig);
  getIt.registerLazySingleton<MyHttpClient>(
    makeDioAdapter,
    dispose: (client) => client.close(),
  );
  getIt.registerLazySingleton<CharacterRepository>(CharacterRepositoryImpl.new);
  getIt.registerLazySingleton<EpisodeRepository>(EpisodeRepositoryImpl.new);
  getIt.registerFactory<SplashViewModel>(SplashViewModel.new);
  getIt.registerFactory<CharactersViewModel>(CharactersViewModel.new);
  getIt.registerFactory<CharacterDetailsViewModel>(CharacterDetailsViewModel.new);
}
