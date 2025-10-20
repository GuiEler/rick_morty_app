import 'package:rxdart/rxdart.dart';

import '../../view/errors/errors.dart';

mixin UIErrorManager {
  final _mainError = BehaviorSubject.seeded(UIError.noError());
  Stream<UIError> get mainErrorStream => _mainError.stream;
  UIError get mainError => _mainError.value;
  set mainError(UIError value) => _mainError.add(value);
}
