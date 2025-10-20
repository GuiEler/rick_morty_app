import 'package:dio/dio.dart';

import '../models/models.dart';

abstract interface class GetEpisodeDetailsUsecase {
  Future<EpisodeModel> call({required int id, required CancelToken? cancelToken});
}
