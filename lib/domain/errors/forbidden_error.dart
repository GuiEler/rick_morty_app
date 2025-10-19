part of 'errors.dart';

class ForbiddenError extends DomainError {
  const ForbiddenError({super.message = '', super.detail = ''});
}
