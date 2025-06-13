import 'package:darzi_nearby/models/models.dart';

extension ListK on List {
  List<Map<String, dynamic>> get toJsonList {
    final data = this;
    if (data.isNotEmpty && data[0] is MultiValue) {
      return data.map((e) => (e as MultiValue).toJson).toList();
    }
    return [];
  }

  List<R> toElementList<T, R>(R Function(T e) toElement) {
    final data = this;
    if (data.isNotEmpty && data[0] is MultiValue) {
      return data
          .map(
            (e) => toElement(e),
          )
          .toList();
    }
    return [];
  }

  List<String?> get isValid {
    final data = this;
    if (data.isEmpty) return [];
    final type = data[0].runtimeType;
    if (type == MultiValue) {
      return data.map((e) => (e as MultiValue).isValidValue).toList();
    }
    if (type == SingleValue) {
      return data.map((e) => (e as SingleValue).isValid).toList();
    }
    return [];
  }

  static List<T> getData<T>(dynamic list, T Function(dynamic item) fromJson) {
    return ((list ?? []) as List).map((e) => fromJson(e)).toList();
  }

  static List<T>? getDataNull<T>(
      dynamic list, T Function(dynamic item) fromJson) {
    try {
      if (list == null) return null;
      return ((list ?? []) as List).map((e) => fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }
}
