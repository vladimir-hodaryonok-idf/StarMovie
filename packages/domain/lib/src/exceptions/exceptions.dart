import 'package:domain/domain.dart';

class AppException implements Exception {
  final String code;
  final String message;
  final String? details;

  const AppException({
    required this.code,
    required this.message,
    required this.details,
  });

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  const FetchDataException({super.details})
      : super(
          code: 'fetch-data',
          message: 'Error During Communication',
        );
}

class BadRequestException extends AppException {
  const BadRequestException(String? details)
      : super(
          code: 'invalid-request',
          message: 'Invalid Request',
          details: details,
        );
}

class UnauthorisedException extends AppException {
  const UnauthorisedException(String? details)
      : super(
          code: 'unauthorised',
          message: 'Unauthorised',
          details: details,
        );
}

class InvalidInputException extends AppException {
  const InvalidInputException(String? details)
      : super(
          code: 'invalid-input',
          message: 'Invalid Input',
          details: details,
        );
}

class AuthenticationException extends AppException {
  const AuthenticationException(String? details)
      : super(
          code: 'authentication-failed',
          message: 'Authentication Failed',
          details: details,
        );
}

class TimeOutException extends AppException {
  const TimeOutException(String? details)
      : super(
          code: 'request-timeout',
          message: 'Request TimeOut',
          details: details,
        );
}

class UnknownException extends AppException {
  const UnknownException(String? details)
      : super(
          code: 'unknown exception',
          message: 'Unknown Error',
          details: details,
        );
}

class ValidationException implements Exception {
  final ValidationResult validationError;

  const ValidationException(this.validationError);
}
