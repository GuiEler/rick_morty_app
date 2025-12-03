import 'package:dio/dio.dart';
import 'package:path/path.dart';

import '../../domain/errors/errors.dart';
import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../../main/di/di.dart';
import '../dtos/dtos.dart';
import '../http/http.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final MyHttpClient httpClient = getIt<MyHttpClient>();

  static const String path = '/episode';

  @override
  Future<EpisodeModel> getEpisodeDetails({required int id, required CancelToken? cancelToken}) async {
    final response = await httpClient.request(
      method: RequestMethod.get,
      path: join(path, id.toString()),
      cancelToken: cancelToken,
    );
    if (response is Map<String, dynamic>) {
      return EpisodeDto.fromMap(response).toModel();
    }
    throw const InvalidDataError();
  }
}
