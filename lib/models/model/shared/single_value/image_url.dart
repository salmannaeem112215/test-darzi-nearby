import 'package:darzi_nearby/models/models.dart';

class ImageUrl extends SingleValue {
  final String value;
  ImageUrl(dynamic value) : value = _getValue(value);
  static final emppty = ImageUrl('');

  static String imageUrlRegex =
      r"^(http(s)?:\/\/)([^\/\s]+\/)([^\s]+(\.(jpg|jpeg|png|gif|bmp))$)";
  static RegExp imageUrlSyntax = RegExp(imageUrlRegex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageUrl &&
          runtimeType == other.runtimeType &&
          value == other.value;

  static _getValue(dynamic value) {
    if (value is List<String> && value.isNotEmpty) value = value[0];

    if (value is String) {
      value = value.trim();
      return value;
    } else if (value is ImageUrl) {
      return value.value;
    }
    return '';
  }

  String get match => value == '' ? '' : value;
  bool get isAssets => value.contains("assets/");
  @override
  String? get isValid {
    return value.isEmpty
        ? "Please enter image url"
        : value.contains("assets/")
            ? null
            : !imageUrlSyntax.hasMatch(value)
                ? "Invalid Image Url Format"
                : null;
  }

  @override
  toString() {
    return value;
  }
}
