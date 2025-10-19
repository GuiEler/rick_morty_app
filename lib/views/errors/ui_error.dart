import '../../domain/errors/errors.dart';
import '../helpers/helpers.dart';

sealed class UIError {
  const UIError._({this.message = '', this.detail = ''});

  final String message;
  final String detail;

  factory UIError.noError({String message = ''}) => _NoError(message: message);
  factory UIError.apiError({String message = '', String detail = ''}) =>
      _ApiError(message: message.isNotEmpty ? message : R.strings.apiError, detail: detail);
  factory UIError.invalidCredentials({String message = '', String detail = ''}) =>
      _InvalidCredentials(message: message.isNotEmpty ? message : R.strings.invalidCredentialsError, detail: detail);
  factory UIError.notFound({String message = '', String detail = ''}) =>
      _NotFound(message: message.isNotEmpty ? message : R.strings.notFoundError, detail: detail);
  factory UIError.noConnection({String message = '', String detail = ''}) =>
      _NoConnection(message: message.isNotEmpty ? message : R.strings.noConnectionError, detail: detail);
  factory UIError.unauthorized({String message = '', String detail = ''}) =>
      _Unauthorized(message: message.isNotEmpty ? message : R.strings.unauthorizedError, detail: detail);
  factory UIError.unexpected({String message = '', String detail = ''}) =>
      _Unexpected(message: message.isNotEmpty ? message : R.strings.unexpectedError, detail: detail);
  factory UIError.timeOut({String message = '', String detail = ''}) =>
      _TimeOut(message: message.isNotEmpty ? message : R.strings.requestTimeOut, detail: detail);
  factory UIError.attemptsExceeded({String message = '', String detail = ''}) => _AttemptsExceeded(
    message: message.isNotEmpty ? message : R.strings.attemptsExceededError,
    detail: detail,
  );
  factory UIError.forbidden({String message = '', String detail = ''}) => _Forbidden(
    message: message.isNotEmpty ? message : R.strings.unauthorizedError,
    detail: detail,
  );
}

final class _NoError extends UIError implements NoError {
  const _NoError({super.message}) : super._();
}

final class _ApiError extends UIError implements ApiError {
  const _ApiError({super.message, super.detail}) : super._();
}

final class _InvalidCredentials extends UIError implements InvalidCredentialsError {
  const _InvalidCredentials({super.message, super.detail}) : super._();
}

final class _NotFound extends UIError implements NotFoundError {
  const _NotFound({super.message, super.detail}) : super._();
}

final class _NoConnection extends UIError implements NoConnectionError {
  const _NoConnection({super.message, super.detail}) : super._();
}

final class _Unauthorized extends UIError implements UnauthorizedError {
  const _Unauthorized({super.message, super.detail}) : super._();
}

final class _Unexpected extends UIError implements UnexpectedError {
  const _Unexpected({super.message, super.detail}) : super._();
}

final class _TimeOut extends UIError implements TimeOutError {
  const _TimeOut({super.message, super.detail}) : super._();
}

final class _AttemptsExceeded extends UIError implements AttemptsExceededError {
  const _AttemptsExceeded({super.message, super.detail}) : super._();
}

final class _Forbidden extends UIError implements ForbiddenError {
  const _Forbidden({super.message, super.detail}) : super._();
}

extension ConvertToUIError on DomainError {
  UIError toUIError({
    ///Overrides standart and server message
    String customMessage = '',

    /// Use standart message instead of server message
    bool useStandartMessage = true,
  }) {
    if (this is UIError) {
      return this as UIError;
    }

    String finalMessage = '';
    if (customMessage.isNotEmpty) {
      finalMessage = customMessage;
    } else if (useStandartMessage == false) {
      finalMessage = message;
    }

    return switch (this) {
      NoError() => UIError.noError(),
      ApiError() => UIError.apiError(message: finalMessage),
      InvalidCredentialsError() => UIError.invalidCredentials(message: finalMessage),
      NotFoundError() => UIError.notFound(message: finalMessage),
      NoConnectionError() => UIError.noConnection(message: finalMessage),
      UnauthorizedError() => UIError.unauthorized(message: finalMessage),
      ForbiddenError() => UIError.forbidden(message: finalMessage),
      TimeOutError() => UIError.timeOut(message: finalMessage),
      InvalidDataError() => UIError.unexpected(message: finalMessage),
      UnexpectedError() => UIError.unexpected(message: finalMessage),
      AttemptsExceededError() => UIError.attemptsExceeded(message: finalMessage),
    };
  }
}
