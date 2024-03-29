//login exceptions
class WrongPasswordAuthException implements Exception {}

class UserNotFoundAuthException implements Exception {}

//register exceptions
class InvalidEmailAuthException implements Exception {}

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

//generic exceptions
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}