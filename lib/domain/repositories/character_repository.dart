import 'package:dio/dio.dart';

import '../models/models.dart';

abstract interface class CharacterRepository {
  Future<CharacterModel> getCharacterDetails({required int id, required CancelToken? cancelToken});
  Future<List<CharacterModel>> getCharacters({required int page, required CancelToken? cancelToken});
}
