import 'package:darzi_nearby/models/models.dart';

class Email extends SingleValue {
  final String value;
  Email(dynamic value) : value = _getValue(value);
  static final emppty = Email('');

  static String emailRegex =
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$';
  static RegExp emailSyntax = RegExp(emailRegex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Email &&
          runtimeType == other.runtimeType &&
          value == other.value;

  static _getValue(dynamic value) {
    if (value is List<String> && value.isNotEmpty) value = value[0];

    if (value is String) {
      value = value.trim();
      return value;
    } else if (value is Email) {
      return value.value;
    }
    return '';
  }

  String get match => value == '' ? '' : value;

  @override
  String? get isValid {
    return value.isEmpty
        ? "Please enter email"
        : !emailSyntax.hasMatch(value)
            ? "Invalid Email Format"
            : null;
  }

  @override
  toString() {
    return value;
  }
}
