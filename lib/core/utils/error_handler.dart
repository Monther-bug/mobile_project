
class ErrorHandler {
  static String getSimpleMessage(dynamic error) {
    final errorString = error.toString().toLowerCase();

    if (_isNetworkError(errorString)) {
      return 'No internet connection. Please check your network.';
    }

    if (_isInvalidCredentials(errorString)) {
      return 'Invalid email or password. Please try again.';
    }

    if (_isUnauthorized(errorString)) {
      return 'Session expired. Please login again.';
    }

    if (_isEmailExists(errorString)) {
      return 'This email is already registered.';
    }

    if (_isInvalidEmail(errorString)) {
      return 'Please enter a valid email address.';
    }

    if (_isServerError(errorString)) {
      return 'Something went wrong. Please try again later.';
    }

    if (_isTimeout(errorString)) {
      return 'Request timed out. Please try again.';
    }

    return 'Something went wrong. Please try again.';
  }

  static bool _isNetworkError(String error) {
    return error.contains('socketexception') ||
        error.contains('no internet') ||
        error.contains('network') ||
        error.contains('connection refused') ||
        error.contains('failed host lookup');
  }

  static bool _isInvalidCredentials(String error) {
    return error.contains('invalid credentials') ||
        error.contains('wrong password') ||
        error.contains('incorrect password') ||
        error.contains('invalid password') ||
        error.contains('user not found') ||
        error.contains('401') ||
        error.contains('unauthenticated');
  }

  static bool _isUnauthorized(String error) {
    return error.contains('unauthorized') ||
        error.contains('token expired') ||
        error.contains('invalid token');
  }

  static bool _isEmailExists(String error) {
    return error.contains('email already') ||
        error.contains('already registered') ||
        error.contains('email has already been taken') ||
        error.contains('duplicate');
  }

  static bool _isInvalidEmail(String error) {
    return error.contains('invalid email') ||
        error.contains('email format');
  }

  static bool _isServerError(String error) {
    return error.contains('500') ||
        error.contains('502') ||
        error.contains('503') ||
        error.contains('server error') ||
        error.contains('internal error');
  }

  static bool _isTimeout(String error) {
    return error.contains('timeout') ||
        error.contains('timed out');
  }
}
