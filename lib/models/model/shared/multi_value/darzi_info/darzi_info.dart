import 'dart:convert';

import 'package:darzi_nearby/models/models.dart';
import 'package:flutter/cupertino.dart';

class DarziInfo extends DarziInfoBasic {
  final ImageUrl userImgUrl;
  final List<ServiceInfo> services;
  final List<ImageUrl> optionalImages;

  DarziInfo({
    required super.uid,
    required super.fullname,
    required super.address,
    required super.locationUrl,
    required super.phoneNo,
    required super.cordinates,
    required dynamic optionalImages,
    required dynamic userImgUrl,
    required dynamic services,
  })  : userImgUrl = ImageUrl(userImgUrl),
        optionalImages = ListK.getData(
          optionalImages,
          (val) => ImageUrl(val),
        ),
        services = ListK.getData(
          services,
          ServiceInfo.create,
        );
  DarziInfo.basic({
    required DarziInfoBasic basic,
    required dynamic userImgUrl,
    required dynamic optionalImages,
    required dynamic services,
  })  : userImgUrl = ImageUrl(userImgUrl),
        optionalImages = ListK.getData(
          optionalImages,
          (val) => ImageUrl(val),
        ),
        services = ListK.getData(
          services,
          ServiceInfo.create,
        ),
        super.copy(basic);
  DarziInfo.id({
    required DarziInfo darzi,
    required String id,
  })  : userImgUrl = darzi.userImgUrl,
        services = darzi.services,
        optionalImages = darzi.optionalImages,
        super.copyId(darzi, id);

  @override
  bool operator ==(Object other) => isIdentical<DarziInfo>(
      other,
      (other) => [
            super == other,
            userImgUrl == other.userImgUrl,
            services == other.services,
          ]);

  factory DarziInfo.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return DarziInfo.fromJson(json);
  }
  factory DarziInfo.fromJson(Map<String, dynamic> json) {
    return DarziInfo(
      uid: json[DarziInfoBasicK.uid],
      fullname: json[DarziInfoBasicK.fullname],
      address: json[DarziInfoBasicK.address],
      phoneNo: json[DarziInfoBasicK.phoneNo],
      locationUrl: json[DarziInfoBasicK.locationUrl],
      cordinates: Cordinates.fromJson(json[DarziInfoBasicK.cordinates]),
      userImgUrl: json[DarziInfoK.userImgUrl],
      optionalImages: ListK.getData(
        json[DarziInfoK.optionalImages],
        (item) => ImageUrl(item),
      ),
      services: ListK.getData(
        json[DarziInfoK.services],
        (item) => ServiceInfo.fromJson(item),
      ),
    );
  }

  @override
  Map<String, dynamic> get toJson {
    final json = super.toJson;
    json.addAll({
      DarziInfoK.userImgUrl: userImgUrl.value,
      DarziInfoK.services: services.toJsonList,
      DarziInfoK.optionalImages: optionalImages.map((e) => e.value).toList(),
    });

    return json;
  }

  @override
  Map<String, dynamic> get toDbJson {
    final json = super.toJson;
    json.addAll({
      DarziInfoK.uid: uid,
      DarziInfoK.userImgUrl: userImgUrl.value,
      DarziInfoK.services: services.toJsonList,
      DarziInfoK.optionalImages: optionalImages.map((e) => e.value).toList(),
    });
    return json;
  }

  @override
  Map<String, List<String>> get toStringJson {
    final stringJson = super.toStringJson;
    stringJson.addAll({
      DarziInfoK.userImgUrl: [userImgUrl.value],
    });
    if (services.isEmpty) return stringJson;

    final stringServices = services.map((e) => e.toStringJson).toList();
    final keys = stringServices[0].keys.toList();

    // WRONG
    final servicesMap = <String, List<String>>{};
    for (var k in keys) {
      final val = <String>[];
      for (var s in stringServices) {
        val.addAll(s[k]!);
      }
      servicesMap[k] = val;
    }
    stringJson.addAll(servicesMap);
    return stringJson;
  }

  @override
  List<String?> get isValid {
    final val = super.isValid;
    val.addAll([
      userImgUrl.value,
      ...services.isValid,
    ]);
    return val;
  }
}

extension DarziInfoK on DarziInfo {
  static const String uid = 'uid';
  static const String userImgUrl = 'user_image_url';
  static const String services = 'services';
  static const String optionalImages = 'optional_images';
}
