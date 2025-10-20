import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../domain/errors/errors.dart';
import '../domain/models/models.dart';
import '../domain/usecases/usecases.dart';
import '../main/di/di.dart';
import '../view/errors/errors.dart';
import 'mixins/mixins.dart';

class CharacterDetailsViewModel with UIErrorFeedbackMixin {
  final GetCharacterDetailsUsecase _getCharacterDetailsUsecase = getIt<GetCharacterDetailsUsecase>();
  final GetEpisodeDetailsUsecase _getEpisodeDetailsUsecase = getIt<GetEpisodeDetailsUsecase>();
  final CancelToken _cancelToken = CancelToken();

  final _isLoading = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoadingStream => _isLoading.stream;
  bool get isLoading => _isLoading.valueOrNull ?? false;
  set isLoading(bool value) => _isLoading.add(value);
  final _characterDetails = BehaviorSubject<CharacterModel?>();
  Stream<CharacterModel?> get characterDetailsStream => _characterDetails.stream;
  CharacterModel? get characterDetails => _characterDetails.valueOrNull;
  Future<void> loadCharacterDetails(int characterId) async {
    try {
      isLoading = true;
      final character = await _getCharacterDetailsUsecase(id: characterId, cancelToken: _cancelToken);
      _characterDetails.add(character);
      await loadEpisodes(character.episodeIds);
    } on DomainError catch (error) {
      mainError = error.toUIError();
    } finally {
      isLoading = false;
    }
  }

  final List<EpisodeModel> episodeList = [];
  Future<void> loadEpisodes(List<int> episodeIds) async {
    try {
      episodeList.clear();
      for (final id in episodeIds) {
        final episode = await _getEpisodeDetailsUsecase(id: id, cancelToken: _cancelToken);
        episodeList.add(episode);
      }
    } on DomainError catch (error) {
      mainError = error.toUIError();
    }
  }

  void dispose() {
    _cancelToken.cancel();
    _characterDetails.close();
  }
}
