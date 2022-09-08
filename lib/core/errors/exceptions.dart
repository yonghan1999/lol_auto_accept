class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class LoginException implements Exception {}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class LocalDatabaseException implements Exception {
  late String _message;

  LocalDatabaseException([String message = 'Local DatabasesException Occurred']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class NotLoginException implements Exception {}
