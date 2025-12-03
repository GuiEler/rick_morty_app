import 'package:dio/dio.dart';
import 'package:path/path.dart';

import '../../domain/errors/errors.dart';
import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../../main/di/di.dart';
import '../dtos/dtos.dart';
import '../http/http.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final MyHttpClient httpClient = getIt<MyHttpClient>();

  static const String path = '/character';

  @override
  Future<CharacterModel> getCharacterDetails({required int id, required CancelToken? cancelToken}) async {
    final response = await httpClient.request(
      method: RequestMethod.get,
      path: join(path, id.toString()),
      cancelToken: cancelToken,
    );
    if (response is Map<String, dynamic>) {
      return CharacterDto.fromMap(response).toModel();
    }
    throw const InvalidDataError();
  }

  @override
  Future<List<CharacterModel>> getCharacters({required int page, required CancelToken? cancelToken}) async {
    final response = await httpClient.request(
      method: RequestMethod.get,
      path: path,
      queryParameters: {'page': page},
      cancelToken: cancelToken,
    );
    if (response is Map && response['results'] is List) {
      return (response['results'] as List).map((map) => CharacterDto.fromMap(map).toModel()).toList();
    }
    throw const InvalidDataError();
  }
}
