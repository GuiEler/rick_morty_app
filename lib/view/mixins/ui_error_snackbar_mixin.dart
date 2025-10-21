import 'package:flutter/widgets.dart';

import '../../domain/errors/errors.dart';
import '../errors/errors.dart';
import '../widgets/widgets.dart';

mixin UIErrorSnackbarMixin {
  void handleMainError({
    required BuildContext context,
    required Stream<UIError> mainErrorStream,
  }) {
    mainErrorStream.listen((error) {
      if (error is! NoError && (error is UnauthorizedError || context.mounted)) {
        Future.delayed(
          Duration.zero,
          () => showMainErrorMessage(errorMessage: error.message, useExpandedVersion: true),
        );
      }
    });
  }
}
