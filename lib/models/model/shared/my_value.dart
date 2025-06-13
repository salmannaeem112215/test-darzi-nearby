abstract class MyValue {
  @override
  String toString();
  List<String?> get _isValid;

  void throwIfNotValid() {
    final errors = _isValid;
    String message = '';
    for (var error in errors) {
      if (error != null) {
        message += error;
        message += ', ';
      }
    }
    if (message.isNotEmpty) {
      throw message;
    }
  }

  String? get formError {
    final errors = _isValid;
    String message = '';
    for (var err in errors) {
      if (err != null) message += '$err, ';
    }
    if (message.isEmpty) return null;
    return message;
  }

  bool isIdentical<T>(Object other, List<bool> Function(T other) check) =>
      identical(this, other) ||
      other is T &&
          runtimeType == other.runtimeType &&
          !check(other as T).contains(false);
}

abstract class SingleValue extends MyValue {
  String? get isValid;
  @override
  List<String?> get _isValid => [isValid];
}

abstract class MultiValue extends MyValue {
  List<String?> get isValid;
  @override
  List<String?> get _isValid => isValid;

  String? get isValidValue {
    String errorMessage = "";
    final errors = isValid;
    for (var error in errors) {
      if (error != null) {
        errorMessage += "$error, ";
      }
    }
    if (errorMessage.isEmpty) return null;
    return errorMessage;
  }

  Map<String, dynamic> get toJson;
}
