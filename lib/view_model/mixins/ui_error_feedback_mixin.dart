import 'package:rxdart/rxdart.dart';

import '../../view/errors/errors.dart';

mixin UIErrorFeedbackMixin {
  final _mainError = BehaviorSubject.seeded(UIError.noError());
  Stream<UIError> get mainErrorStream => _mainError.stream;
  UIError get mainError => _mainError.valueOrNull ?? UIError.noError();
  set mainError(UIError value) => _mainError.add(value);
}
