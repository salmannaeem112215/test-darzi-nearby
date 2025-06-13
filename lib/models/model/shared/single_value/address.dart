import 'package:darzi_nearby/models/models.dart';

class Address extends SingleValue {
  final String value;
  Address(dynamic value) : value = _getValue(value);
  static final emppty = Address('');

  static String addressRegex = r'^[\w\s\d.,#/-]+$';
  static RegExp addressSyntax = RegExp(addressRegex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          value == other.value;

  static _getValue(dynamic value) {
    if (value is List<String> && value.isNotEmpty) value = value[0];

    if (value is String) {
      value = value.trim();
      return value;
    } else if (value is Address) {
      return value.value;
    }
    return '';
  }

  String get match => value == '' ? '' : value;

  @override
  String? get isValid {
    return value.isEmpty
        ? "Please enter address"
        : !addressSyntax.hasMatch(value)
            ? "Invalid Address Format"
            : null;
  }

  @override
  toString() {
    return value;
  }
}
