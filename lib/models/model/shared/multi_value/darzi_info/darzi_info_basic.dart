import 'dart:convert';

import 'package:darzi_nearby/models/models.dart';

class DarziInfoBasic extends MultiValue {
  final String uid;
  final Fullname fullname;
  final Address address;
  final LocationURL locationUrl;
  final Cordinates cordinates;
  final PhoneNo phoneNo;

  DarziInfoBasic({
    required this.uid,
    required dynamic fullname,
    required dynamic address,
    required dynamic locationUrl,
    required dynamic phoneNo,
    required dynamic cordinates,
  })  : fullname = Fullname(fullname),
        address = Address(address),
        locationUrl = LocationURL(locationUrl),
        phoneNo = PhoneNo(phoneNo),
        cordinates = Cordinates(cordinates);

  DarziInfoBasic.copy(
    DarziInfoBasic value,
  )   : uid = value.uid,
        fullname = value.fullname,
        address = value.address,
        locationUrl = value.locationUrl,
        phoneNo = value.phoneNo,
        cordinates = value.cordinates;
  DarziInfoBasic.copyId(
    DarziInfoBasic value,
    this.uid,
  )   : fullname = value.fullname,
        address = value.address,
        locationUrl = value.locationUrl,
        phoneNo = value.phoneNo,
        cordinates = value.cordinates;

  @override
  bool operator ==(Object other) => isIdentical<DarziInfoBasic>(
      other,
      (other) => [
            uid == other.uid,
            cordinates == other.cordinates,
            fullname == other.fullname,
            address == other.address,
            locationUrl == other.locationUrl,
            phoneNo == other.phoneNo,
          ]);

  factory DarziInfoBasic.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return DarziInfoBasic.fromJson(json);
  }
  factory DarziInfoBasic.fromJson(Map<String, dynamic> json) {
    return DarziInfoBasic(
      uid: json[DarziInfoBasicK.uid],
      fullname: json[DarziInfoBasicK.fullname],
      address: json[DarziInfoBasicK.address],
      phoneNo: json[DarziInfoBasicK.phoneNo],
      locationUrl: json[DarziInfoBasicK.locationUrl],
      cordinates: Cordinates.fromJson(json[DarziInfoBasicK.cordinates]),
    );
  }

  @override
  Map<String, dynamic> get toJson {
    return {
      DarziInfoBasicK.uid: uid,
      DarziInfoBasicK.fullname: fullname.value,
      DarziInfoBasicK.phoneNo: phoneNo.value,
      DarziInfoBasicK.address: address.value,
      DarziInfoBasicK.locationUrl: locationUrl.value,
      DarziInfoBasicK.cordinates: cordinates.toJson,
    };
  }

  Map<String, List<String>> get toStringJson {
    final json = {
      DarziInfoBasicK.fullname: [fullname.value],
      DarziInfoBasicK.phoneNo: [phoneNo.value],
      DarziInfoBasicK.address: [address.value],
      DarziInfoBasicK.locationUrl: [locationUrl.value],
    };
    json.addAll(cordinates.toStringJson);
    return json;
  }

  @override
  List<String?> get isValid => [
        fullname.isValid,
        address.isValid,
        phoneNo.isValid,
        locationUrl.isValid,
        cordinates.isValidValue,
      ];
}

extension DarziInfoBasicK on DarziInfoBasic {
  static const String fullname = 'fullname';
  static const String address = 'address';
  static const String cordinates = 'cordinates';
  static const String phoneNo = 'phone_no';
  static const String locationUrl = 'location_url';
  static const String uid = 'uid';
}
