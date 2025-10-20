import 'package:dio/dio.dart';

import '../models/models.dart';

abstract interface class EpisodeRepository {
  Future<EpisodeModel> getEpisodeDetails({required int id, required CancelToken? cancelToken});
}
