import 'package:darzi_nearby/models/models.dart';

abstract class ServiceInfoBasic extends MultiValue {
  final Fullname serviceName;
  final Description description;

  ServiceInfoBasic({
    required dynamic serviceName,
    required dynamic description,
  })  : serviceName = Fullname(serviceName),
        description = Description(description);

  @override
  bool operator ==(Object other) => isIdentical<ServiceInfoBasic>(
      other,
      (other) => [
            serviceName == other.serviceName,
            description == other.description,
          ]);
  @override
  Map<String, dynamic> get toJson {
    return {
      ServiceInfoBasicK.name: serviceName.value,
      ServiceInfoBasicK.description: description.value,
    };
  }

  Map<String, List<String>> get toStringJson => {
        ServiceInfoBasicK.name: [serviceName.value],
        ServiceInfoBasicK.description: [description.value],
      };

  @override
  List<String?> get isValid => [
        serviceName.isValid,
      ];
}

extension ServiceInfoBasicK on ServiceInfoBasic {
  static const String name = 'service_name';
  static const String description = 'description';
}
