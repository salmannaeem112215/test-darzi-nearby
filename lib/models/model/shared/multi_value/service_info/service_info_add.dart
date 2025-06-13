import 'package:darzi_nearby/models/models.dart';

class ServiceInfoAdd extends ServiceInfoBasic {
  final FileOrImgUrl serviceImageFile;

  ServiceInfoAdd({
    required super.serviceName,
    required super.description,
    required this.serviceImageFile,
  });

  @override
  bool operator ==(Object other) => isIdentical<ServiceInfoAdd>(
      other,
      (other) => [
            serviceImageFile.value == other.serviceImageFile.value,
            serviceName == other.serviceName,
            description == other.description,
          ]);

  @override
  Map<String, dynamic> get toJson {
    final json = super.toJson;
    json.addAll({
      ServiceInfoK.serviceImgUrl: serviceImageFile.value,
    });
    return json;
  }

  @override
  Map<String, List<String>> get toStringJson => {
        ServiceInfoBasicK.name: [serviceName.value],
        ServiceInfoK.serviceImgUrl: [serviceImageFile.value],
      };

  @override
  List<String?> get isValid => [
        serviceName.isValid,
      ];
}

extension ServiceInfoAddK on ServiceInfoAdd {
  static const String serviceImageFile = 'service_image_file';
}
