part of 'errors.dart';

class ApiError extends DomainError {
  const ApiError({super.message = '', super.detail = ''});
}
