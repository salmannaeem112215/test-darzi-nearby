import 'package:darzi_nearby/models/models.dart';

class Password extends SingleValue {
  final String value;
  Password(dynamic value) : value = _getValue(value);
  static final emppty = Password('');

  static const String _regxString =
      // r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[_ ])[A-Za-z\d_ ]{8,}$'; // old with space and undderscore
      // r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8}$';

  static final RegExp regx = RegExp(_regxString);
  @override
  String? get isValid {
    return value.isEmpty
        ? "Please enter password"
        : !regx.hasMatch(value)
            ? _detailError(value)
            : null;
  }

  String? _detailError(String error) {
    String message = '';
    print('ERROR $error');
    if (value.length < 8) {
      message += "8 characters long. ";
    }

    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      message += "one letter. ";
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      message += " one digit. ";
    }

    if (RegExp(r'[^A-Za-z\d_ ]').hasMatch(value)) {
      message += "no special characters.";
    }
    print("MESSAGFE $message");
    if (message.isNotEmpty) {
      return "Invalid Password: must contain $message";
    }
    return "Invalid Password: must contain at least one letter, one digit, and be at least 8 characters long.";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Password &&
          runtimeType == other.runtimeType &&
          value == other.value;

  static _getValue(dynamic value) {
    if (value is List<String> && value.isNotEmpty) value = value[0];

    if (value is String) {
      value = value.trim();
      return value;
    } else if (value is Password) {
      return value.value;
    }
    return '';
  }

  String get match => value == '' ? '' : value;

  @override
  toString() {
    return value;
  }
}
