import 'package:darzi_nearby/models/models.dart';

class Description extends SingleValue {
  final String value;
  Description(dynamic value) : value = _getValue(value);
  static final emppty = Description('');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Description &&
          runtimeType == other.runtimeType &&
          value == other.value;

  static _getValue(dynamic value) {
    if (value is List<String> && value.isNotEmpty) value = value[0];

    if (value is String) {
      value = value.trim();
      return value;
    } else if (value is Description) {
      return value.value;
    }
    return '';
  }

  String get match => value == '' ? '' : value;

  @override
  String? get isValid => null;

  @override
  toString() {
    return value;
  }
}
