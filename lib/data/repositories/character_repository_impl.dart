import 'package:dio/dio.dart';
import 'package:path/path.dart';

import '../../domain/errors/errors.dart';
import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../dtos/dtos.dart';
import '../http/http.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final MyHttpClient httpClient;

  static const String path = '/character';

  CharacterRepositoryImpl(this.httpClient);

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
    if (response is List) {
      return response.map((map) => CharacterDto.fromMap(map).toModel()).toList();
    }
    throw const InvalidDataError();
  }
}
