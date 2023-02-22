class Failure extends Error {
  final String message;
  final int? statusCode;
  Failure({required this.message, this.statusCode});
}

class ServerException extends Failure {
  final dynamic error;
  ServerException({required String message, int? statusCode, this.error})
      : super(message: message, statusCode: statusCode);
}
