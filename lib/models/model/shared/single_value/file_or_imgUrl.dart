// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';

import 'package:darzi_nearby/models/models.dart';
import 'package:image_cropper/image_cropper.dart' show CroppedFile;

class FileOrImgUrl {
  final dynamic value;
  FileOrImgUrl(dynamic value) : value = _isValid(value) ? value : null;
  static bool _isValid(dynamic val) =>
      val is ImageUrl || val is File || val is CroppedFile || val is String;

  String? get isValid {
    return !_isValid(value) ? "Invalid Upload Media " : null;
  }

  String get imgStringValue {
    final d = value;
    final res = d is File
        ? d.absolute.path
        : d is CroppedFile
            ? d.path
            : d is ImageUrl
                ? d.value
                : d is String
                    ? d
                    : '';
    return res;
  }

  Future<Uint8List?> get data async {
    if (isFile) {
      return (value as File).readAsBytesSync();
    }
    if (isCroppedFile) {
      return (value as CroppedFile).readAsBytes();
    }
    return null;
  }

  bool get isImgLink => value is ImageUrl;
  bool get isString => value is String;
  bool get isFile => value is File;
  bool get isCroppedFile => value is CroppedFile;
  @override
  toString() {
    return imgStringValue;
  }
}
