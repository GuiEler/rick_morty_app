import 'package:dio/dio.dart';

import '../models/models.dart';

abstract interface class GetCharactersUsecase {
  Future<List<CharacterModel>> call({required int page, CancelToken? cancelToken});
}
