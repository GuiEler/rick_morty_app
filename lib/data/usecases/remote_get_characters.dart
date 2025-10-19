import 'package:dio/dio.dart';

import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class RemoteGetCharacters implements GetCharactersUsecase {
  const RemoteGetCharacters(this.repository);

  final CharacterRepository repository;

  @override
  Future<List<CharacterModel>> call({required int page, CancelToken? cancelToken}) =>
      repository.getCharacters(page: page, cancelToken: cancelToken);
}
