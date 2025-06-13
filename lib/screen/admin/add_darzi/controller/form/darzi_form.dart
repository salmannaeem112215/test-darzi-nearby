import 'dart:io';

import 'package:darzi_nearby/darzi_nearby.dart';

class DarziForm {
  final Rx<FileOrImgUrl?> darziImage = Rx<FileOrImgUrl?>(null);
  final RxList<FileOrImgUrl> darziMediaImages = <FileOrImgUrl>[].obs;
  static String? _cLat(String? val) {
    final val1 = double.tryParse(val ?? '-100') ?? -100;
    if (val1 > 90 || val1 < -90) {
      return 'valid-range (-90,90)';
    }
    return null;
  }

  static String? _cLon(String? val) {
    final val1 = double.tryParse(val ?? '-1000') ?? -1000;
    if (val1 > 180 || val1 < -180) {
      return 'valid-range (-180,180)';
    }
    return null;
  }

  final fullname = DarziFormEnity(
    "Darzi Fullname",
    "Enter Name",
    keyboardType: TextInputType.name,
    validator: (val) => Fullname(val).isValid,
  );
  final phoneNo = DarziFormEnity(
    "Darzi Phone Number",
    "Eg. 3251234567",
    keyboardType: TextInputType.phone,
    validator: (val) => PhoneNo(val).isValid,
  );
  final address = DarziFormEnity(
    "Darzi Address",
    "Enter Address",
    validator: (val) => Address(val).isValid,
  );
  final addressUrl = DarziFormEnity(
    "Darzi Location URL",
    "https://maps.app.goo.gl/efiEgL6gfXpLkcvf8",
    keyboardType: TextInputType.url,
    validator: (val) => LocationURL(val).isValid,
  );
  final latitude = DarziFormEnity(
    "Darzi latitude",
    "34.1234567",
    keyboardType:
        const TextInputType.numberWithOptions(signed: true, decimal: true),
    validator: _cLat,
  );
  final longitude = DarziFormEnity(
    "Darzi longitude",
    "76.1234567",
    keyboardType:
        const TextInputType.numberWithOptions(signed: true, decimal: true),
    validator: _cLon,
  );
  final service = DarziFormServiceEnity();
  final key = GlobalKey<FormState>();
  DarziForm({DarziInfo? oldData}) {
    latitude.onChanged = (val) {
      if (val != null && val.contains(",")) {
        parseCoordinates(val);
      }
    };
    longitude.onChanged = (val) {
      if (val != null && val.contains(",")) {
        parseCoordinates(val);
      }
    };

    // if OLD DATA EXIST / EDIT
    if (oldData != null) {
      darziImage.value = FileOrImgUrl(oldData.userImgUrl);
      darziMediaImages.assignAll(
          oldData.optionalImages.map((e) => FileOrImgUrl(e)).toList());
      fullname.controller.text = oldData.fullname.value;
      phoneNo.controller.text = oldData.phoneNo.value;
      address.controller.text = oldData.address.value;
      addressUrl.controller.text = oldData.locationUrl.value;
      latitude.controller.text = oldData.cordinates.lat.toString();
      longitude.controller.text = oldData.cordinates.lon.toString();
      service.updateInfo(oldData.services);
    }
  }

  void parseCoordinates(String input) {
    List<String> coordinates = input.split(',');
    if (coordinates.length == 2) {
      if (coordinates[1].isEmpty) {
        latitude.controller.text = coordinates[0].trim();
        longitude.controller.text = coordinates[1].trim();

        Get.focusScope?.nextFocus();
      } else {
        latitude.controller.text = coordinates[0].trim();
        longitude.controller.text = coordinates[1].trim();
      }
    } else {}
  }

  bool isValid() {
    key.currentState!.validate();

    String error = '';
    //TODO : ADD OR REMOVE IMAGE VALIDATION
    // final imgVal = darziImage.value;

    // if (imgVal != null && (imgVal is String && imgVal.isEmpty)) {
    // error += 'Please Add Darzi Images, ';
    // }
    error += service.isValid ?? '';
    if (error.isNotEmpty) {
      Utility.showError(error);
      return false;
    }
    return key.currentState!.validate();
  }

  DarziInfo darziInfo({
    required String darziImage,
    required List<String> servicesUrl,
    required List<String> optionalImages,
  }) {
    if (servicesUrl.length != service.data.length) {
      throw 'Invalid Images Length';
    }
    final services = <ServiceInfo>[];
    for (var i = 0; i < service.data.length; i++) {
      services.add(ServiceInfo(
        serviceName: service.data[i].nameAndPic.controller.text,
        description: service.data[i].description.controller.text,
        serviceImageUrl: servicesUrl[i],
      ));
    }

    return DarziInfo(
      uid: '',
      optionalImages: optionalImages,
      fullname: fullname.controller.text,
      address: address,
      locationUrl: addressUrl,
      phoneNo: phoneNo,
      userImgUrl: darziImage,
      cordinates: Cordinates.latLng(latitude, longitude),
      services: services,
    );
  }

  DarziInfoAdd darziInfoAdd({String? uid}) {
    final services = <ServiceInfoAdd>[];
    for (var i = 0; i < service.data.length; i++) {
      services.add(ServiceInfoAdd(
        serviceName: service.data[i].nameAndPic.controller.text,
        description: service.data[i].description.controller.text,
        serviceImageFile: service.data[i].nameAndPic.url.value!,
      ));
    }
    final d = darziMediaImages.toList();
    d.remove(null);

    return DarziInfoAdd(
      optionalMedia: d,
      serviceAdds: services,
      userImgFile: darziImage.value!,
      uid: uid ?? '',
      fullname: fullname.controller.text,
      address: address.controller.text,
      locationUrl: addressUrl.controller.text,
      phoneNo: phoneNo.controller.text,
      cordinates: Cordinates.latLng(
        latitude.controller.text,
        longitude.controller.text,
      ),
    );
  }
}
