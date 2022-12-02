enum ApiExceptionType {
  userNotFound,
  network,
  other,
}

class ApiException implements Exception {
  final ApiExceptionType type;
  ApiException(this.type);
}
