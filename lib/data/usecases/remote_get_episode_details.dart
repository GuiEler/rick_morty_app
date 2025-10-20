import 'package:dio/dio.dart';

import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class RemoteGetEpisodeDetails implements GetEpisodeDetailsUsecase {
  const RemoteGetEpisodeDetails(this.repository);

  final EpisodeRepository repository;

  @override
  Future<EpisodeModel> call({required int id, required CancelToken? cancelToken}) =>
      repository.getEpisodeDetails(id: id, cancelToken: cancelToken);
}
