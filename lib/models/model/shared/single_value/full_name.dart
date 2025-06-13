import 'package:darzi_nearby/models/models.dart';

class Fullname extends SingleValue {
  final String value;
  Fullname(dynamic value) : value = _getValue(value);
  static final emppty = Fullname('');

  static String nameRegex = r'^[a-zA-Z\s]+$';
  static RegExp nameSyntax = RegExp(nameRegex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fullname &&
          runtimeType == other.runtimeType &&
          value == other.value;

  static _getValue(dynamic value) {
    if (value is List<String> && value.isNotEmpty) value = value[0];

    if (value is String) {
      value = value.trim();
      return value;
    } else if (value is Fullname) {
      return value.value;
    }
    return '';
  }

  String get match => value == '' ? '' : value;

  @override
  String? get isValid {
    return value.isEmpty
        ? "Please enter name"
        : !nameSyntax.hasMatch(value)
            ? "Invalid Name Format"
            : null;
  }

  @override
  toString() {
    return value;
  }
}
