import 'package:dio/dio.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../domain/errors/errors.dart';
import '../domain/models/models.dart';
import '../domain/usecases/usecases.dart';
import '../main/di/di.dart';
import '../view/errors/errors.dart';
import 'mixins/mixins.dart';

class CharactersViewModel with UIErrorManager {
  final CancelToken cancelToken = CancelToken();
  final GetCharactersUsecase getCharactersUsecase = getIt<GetCharactersUsecase>();
  late final PagingController<int, CharacterModel> pagingController = PagingController(
    fetchPage: fetchCharacters,
    getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
  );

  Future<List<CharacterModel>> fetchCharacters(int page) async {
    try {
      return await getCharactersUsecase(page: page, cancelToken: cancelToken);
    } on DomainError catch (error) {
      mainError = error.toUIError();
      rethrow;
    }
  }

  void dispose() {
    cancelToken.cancel();
  }
}
