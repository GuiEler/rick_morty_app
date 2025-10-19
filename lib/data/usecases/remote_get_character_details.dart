import 'package:dio/dio.dart';

import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/get_character_details_usecase.dart';

class RemoteGetCharacterDetails implements GetCharacterDetailsUsecase {
  const RemoteGetCharacterDetails(this.repository);

  final CharacterRepository repository;

  @override
  Future<CharacterModel> call({required int id, CancelToken? cancelToken}) =>
      repository.getCharacterDetails(id: id, cancelToken: cancelToken);
}
