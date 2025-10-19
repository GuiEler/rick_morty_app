import 'package:dio/dio.dart';

import '../models/models.dart';

abstract interface class GetCharacterDetailsUsecase {
  Future<CharacterModel> call({required int id, CancelToken? cancelToken});
}
