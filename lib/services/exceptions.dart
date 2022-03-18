class AppException implements Exception {
  final message;
  final prefix;

  AppException({required this.message, required this.prefix});

  String toString() {
    return "$prefix $message";
  }
}

class ServerError extends AppException {
  ServerError([message])
      : super(message: message, prefix: "Error at the server:");
}

class APIKeyError extends AppException {
  APIKeyError([message])
      : super(message: message, prefix: "API Key not found in headers");
}

class UserNotFound extends AppException {
  UserNotFound([message])
      : super(message: message, prefix: "User not found in the database");
}

class PasswordError extends AppException {
  PasswordError([message])
      : super(message: message, prefix: "Password mismatch");
}

class ImproperCall extends AppException {
  ImproperCall([message])
      : super(
            message: message,
            prefix: "API Call soesn't have required parameters");
}

class InternetError extends AppException {
  InternetError([message])
      : super(message: message, prefix: "Internet connection not found");
}
