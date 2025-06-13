import 'package:darzi_nearby/models/models.dart';

class DarziInfoAdd extends DarziInfoBasic {
  final FileOrImgUrl userImgFile;
  final List<ServiceInfoAdd> serviceAdds;
  final List<FileOrImgUrl> optionalMedia;

  DarziInfoAdd({
    required super.uid,
    required super.fullname,
    required super.address,
    required super.locationUrl,
    required super.phoneNo,
    required super.cordinates,
    required this.userImgFile,
    required this.serviceAdds,
    required this.optionalMedia,
  });
  factory DarziInfoAdd.uid(String uid, DarziInfoAdd data) {
    return DarziInfoAdd(
      uid: uid,
      address: data.address,
      cordinates: data.cordinates,
      fullname: data.fullname,
      locationUrl: data.locationUrl,
      phoneNo: data.phoneNo,
      serviceAdds: data.serviceAdds,
      userImgFile: data.userImgFile,
      optionalMedia: data.optionalMedia,
    );
  }
  DarziInfoAdd.basic({
    required DarziInfoBasic basic,
    required this.userImgFile,
    required this.serviceAdds,
    required this.optionalMedia,
  }) : super.copy(basic);

  @override
  bool operator ==(Object other) => isIdentical<DarziInfoAdd>(
      other,
      (other) => [
            super == other,
            userImgFile == other.userImgFile,
            serviceAdds == other.serviceAdds,
          ]);

  @override
  Map<String, dynamic> get toJson {
    final json = super.toJson;
    json.addAll({
      DarziInfoAddK.userImgFile: userImgFile.imgStringValue,
      DarziInfoAddK.serviceAdds: serviceAdds.toJsonList,
      DarziInfoAddK.optionalMedia:
          optionalMedia.map((e) => e.imgStringValue).toList(),
    });

    return json;
  }

  @override
  Map<String, List<String>> get toStringJson {
    final stringJson = super.toStringJson;
    stringJson.addAll({
      DarziInfoAddK.userImgFile: [userImgFile.imgStringValue],
    });
    if (serviceAdds.isEmpty) return stringJson;

    final stringServiceAdds = serviceAdds.map((e) => e.toStringJson).toList();
    final keys = stringServiceAdds[0].keys.toList();

    // WRONG
    final serviceAddsMap = <String, List<String>>{};
    for (var k in keys) {
      final val = <String>[];
      for (var s in stringServiceAdds) {
        val.addAll(s[k]!);
      }
      serviceAddsMap[k] = val;
    }
    stringJson.addAll(serviceAddsMap);
    return stringJson;
  }

  @override
  List<String?> get isValid {
    final val = super.isValid;
    val.addAll([
      ...serviceAdds.isValid,
    ]);
    return val;
  }
}

extension DarziInfoAddK on DarziInfoAdd {
  static const String userImgFile = 'user_image_file';
  static const String serviceAdds = 'service_adds';
  static const String optionalMedia = 'optional_media';
}
