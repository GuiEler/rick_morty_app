import '../../data/usecases/usecases.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';
import 'di.dart';

void setupUsecases() {
  getIt.registerLazySingleton<GetCharacterDetailsUsecase>(
    () => RemoteGetCharacterDetails(getIt<CharacterRepository>()),
  );
}
