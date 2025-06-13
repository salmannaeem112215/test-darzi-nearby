import 'package:darzi_nearby/models/models.dart';

class LocationURL extends SingleValue {
  final String value;
  LocationURL(dynamic value) : value = _getValue(value);
  static final emppty = LocationURL('');

  static String locationUrlRegex = r'^https?:\/\/[^\s/$.?#].[^\s]*$';
  static RegExp locationUrlSyntax = RegExp(locationUrlRegex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationURL &&
          runtimeType == other.runtimeType &&
          value == other.value;

  static _getValue(dynamic value) {
    if (value is List<String> && value.isNotEmpty) value = value[0];

    if (value is String) {
      value = value.trim();
      return value;
    } else if (value is LocationURL) {
      return value.value;
    }
    return '';
  }

  String get match => value == '' ? '' : value;

  @override
  String? get isValid {
    return value.isEmpty
        ? "Please enter location url"
        : !locationUrlSyntax.hasMatch(value)
            ? "Invalid Location url Format"
            : null;
  }

  @override
  toString() {
    return value;
  }
}
