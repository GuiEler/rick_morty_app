part of 'errors.dart';

class AttemptsExceededError extends DomainError {
  const AttemptsExceededError({super.message = '', super.detail = ''});
}
