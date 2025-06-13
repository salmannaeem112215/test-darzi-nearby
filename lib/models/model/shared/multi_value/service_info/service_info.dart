import 'dart:convert';

import 'package:darzi_nearby/models/models.dart';

class ServiceInfo extends ServiceInfoBasic {
  final ImageUrl serviceImgUrl;

  ServiceInfo({
    required super.serviceName,
    required dynamic serviceImageUrl,
    required super.description,
  }) : serviceImgUrl = ImageUrl(serviceImageUrl);

  @override
  bool operator ==(Object other) => isIdentical<ServiceInfo>(
      other,
      (other) => [
            serviceImgUrl == other.serviceImgUrl,
            serviceName == other.serviceName,
            description == other.description,
          ]);

  factory ServiceInfo.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return ServiceInfo.fromJson(json);
  }
  factory ServiceInfo.fromJson(dynamic json) {
    return ServiceInfo(
      serviceName: json[ServiceInfoBasicK.name],
      description: json[ServiceInfoBasicK.description],
      serviceImageUrl: json[ServiceInfoK.serviceImgUrl],
    );
  }
  factory ServiceInfo.create(dynamic value) {
    if (value is ServiceInfo) return value;
    if (value is Map) return ServiceInfo.fromJson(value.cast());
    return ServiceInfo(
      serviceName: '',
      description: '',
      serviceImageUrl: '',
    );
  }

  @override
  Map<String, dynamic> get toJson {
    final json = super.toJson;
    json.addAll({
      ServiceInfoK.serviceImgUrl: serviceImgUrl.value,
    });
    return json;
  }

  @override
  Map<String, List<String>> get toStringJson => {
        ServiceInfoBasicK.name: [serviceName.value],
        ServiceInfoBasicK.description: [description.value],
        ServiceInfoK.serviceImgUrl: [serviceImgUrl.value],
      };

  @override
  List<String?> get isValid => [
        serviceImgUrl.isValid,
        serviceName.isValid,
      ];
}

extension ServiceInfoK on ServiceInfo {
  static const String serviceImgUrl = 'service_image_url';
}
