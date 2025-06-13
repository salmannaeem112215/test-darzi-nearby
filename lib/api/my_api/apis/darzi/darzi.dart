import 'package:darzi_nearby/api/darzi_nearby_api.dart';
import 'package:flutter/foundation.dart';

class DarziApi extends MyApi {
  DarziApi(ServerApi api)
      :
        // _service = ServiceApi(api),
        super(api);

  // final ServiceApi _service;
  static const String isValidKey_ = 'is_valid';
  CollectionReference get _coll => api.firestore.collection('darzi');
  DocumentReference _darziDoc(String uid) => _coll.doc(uid);
  Future<Iterable<Map<String, dynamic>>> get _getAllDarzi async {
    QuerySnapshot snapshot = await _coll.get();
    return snapshot.docs.map((e) => e.data() as Map<String, dynamic>);
  }

  Future<List<QueryDocumentSnapshot>> get _getAllDarziSnaps async {
    QuerySnapshot snapshot = await _coll.get();
    return snapshot.docs;
  }

  Future<DarziInfo> addDarzi(DarziInfoAdd darziInfoAdd) async =>
      adminOnly<DarziInfo>((adminInfo) async => await _addDarzi(darziInfoAdd));
  Future<DarziInfo> editDarzi(DarziInfoAdd darziInfoAdd) async =>
      adminOnly<DarziInfo>((adminInfo) async => await _editDarzi(darziInfoAdd));
  Future<String?> removeDarzi(String darziUid) async =>
      adminOnly<String?>((adminInfo) async => await _removeDarzi(darziUid));

  Future<List<DarziInfo>> getDarziByName(String darziName) async {
    try {
      final allDarzi = await _getAllDarzi;
      final res = <DarziInfo>[];
      darziName = darziName.toLowerCase();
      for (var darzi in allDarzi) {
        if (darzi[isValidKey_] != true) {
          // MAKE SURE DELETE THIS OR ETC
          continue;
        }
        try {
          String name = darzi[DarziInfoBasicK.fullname] ?? '';
          if (name.toLowerCase().contains(darziName)) {
            res.add(DarziInfo.fromJson(darzi));
          }
        } catch (e) {
//
        }
      }
      return res;
    } catch (e) {
      debugPrint("ERROR 2 $e");
      return [];
    }
  }

  Future<List<DarziInfoWithDistance>> getDarziByCordinates(
      Cordinates cordinates) async {
    try {
      final allDarzi = await _getAllDarzi;
      final res = <DarziInfoWithDistance>[];
      for (var darzi in allDarzi) {
        if (darzi[isValidKey_] != true) {
          // MAKE SURE DELETE THIS OR ETC
          continue;
        }
        try {
          final dCor = Cordinates.fromJson(darzi[DarziInfoBasicK.cordinates]);
          final distance = cordinates.distance(dCor);
          if (distance <= 2500) {
            res.add(DarziInfoWithDistance(
              DarziInfo.fromJson(darzi),
              distance,
            ));
          }
        } catch (e) {
          debugPrint("ERROR $e");
        }
      }
      return res;
    } catch (e) {
      debugPrint("ERROR 3 $e");
      return [];
    }
  }

  // Future<void> updateDarzi(String darziUid, DarziInfo darzi) async =>
  //     adminOnly((adminInfo) async {
  //       darziDoc(darziUid).update({
  //         DarziInfoK.name: darzi.fullName.value,
  //         DarziInfoK.coordinates: {
  //           CordinateInfoK.x: darzi.coordinates.x.value,
  //           CordinateInfoK.y: darzi.coordinates.y.value
  //         },
  //         DarziInfoK.userImgUrl: darzi.userImgUrl.value,
  //         DarziInfoK.phoneNo: darzi.phoneNo.value,
  //         DarziInfoK.address: darzi.address.value,
  //         DarziInfoK.locationUrl: darzi.locationUrl.value,
  //       }).catchError((error) {
  //         throw error;
  //       });
  //       ServerApiX.debugPrint('Darzi Info Updated');
  //     });

  Future<DarziInfo?> getDarzi(String darziUid) async {
    try {
      DocumentSnapshot darziSnapshot = await _darziDoc(darziUid).get();

      if (darziSnapshot.exists) {
        var darziData = darziSnapshot.data()!;
        return DarziInfo.fromJson(darziData as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      // return null;
      throw 'Error retrieving Darzi: $e';
    }
  }

  // REQUIRED FUNCTIONS
  FutureOr<DarziInfo> _editDarzi(
    DarziInfoAdd dataWithId,
  ) async {
    final data = dataWithId;

    final darziImageUrl = data.userImgFile.value is String
        ? ImageUrl(data.userImgFile.value)
        : data.userImgFile.value is ImageUrl
            ? data.userImgFile.value as ImageUrl
            : await _addDarziImage(data.userImgFile, data);

    final servicesData = await _addServicesImages(data.serviceAdds, data);
    final optionalImages = await _addOptionalImages(data.optionalMedia, data);
    final darzi = DarziInfo.basic(
      basic: data,
      userImgUrl: darziImageUrl,
      optionalImages: optionalImages,
      services: servicesData,
    );
    return _addDarziInDb(darzi);
  }

  FutureOr<DarziInfo> _addDarzi(DarziInfoAdd dataWithoutId) async {
    final uid = (await _coll.add(<String, dynamic>{isValidKey_: false})).id;
    final data = DarziInfoAdd.uid(uid, dataWithoutId);
    final darziImageUrl = data.userImgFile is String
        ? data.userImgFile
        : await _addDarziImage(data.userImgFile, data);
    final servicesData = await _addServicesImages(data.serviceAdds, data);
    final optionalImages = await _addOptionalImages(data.optionalMedia, data);
    final darzi = DarziInfo.basic(
      basic: data,
      userImgUrl: darziImageUrl,
      optionalImages: optionalImages,
      services: servicesData,
    );
    return _addDarziInDb(darzi);
  }

  FutureOr<String?> _removeDarzi(String uid) async {
    try {
      await _darziDoc(uid).delete();
      return null;
    } catch (e) {
      return handleError(e, "Darzi not removed");
    }
  }

  Future<DarziInfo> _addDarziInDb(DarziInfo darzi) async {
    // TODO: please verify this
    try {
      final json = darzi.toDbJson;
      json[isValidKey_] = true;
      final rid = await _coll.doc(darzi.uid).update(json);
      return darzi;
    } catch (e) {
      throw handleError(e, 'Darzi not added');
    }
  }

  static final SettableMetadata metadata =
      SettableMetadata(contentType: 'image/jpeg');
  Future<ImageUrl> _addDarziImage(
      FileOrImgUrl val, DarziInfoBasic darzi) async {
    if (val.isFile || val.isCroppedFile) {
      Reference storageRef =
          api.storage.ref().child('profile_pic').child('${darzi.uid}.jpg');
      final data = await val.data;
      await storageRef.putData(data!, metadata);
      String downloadURL = await storageRef.getDownloadURL();
      return ImageUrl(downloadURL);
    }
    return ImageUrl(val.imgStringValue);
  }

  Future<ServiceInfo> _addServiceImage(
      ServiceInfoAdd data, DarziInfoBasic darzi) async {
    final imgFile = data.serviceImageFile;
    String path = imgFile.imgStringValue;
    if (imgFile.isFile || imgFile.isCroppedFile) {
      String imageName = '${darzi.uid}_${data.serviceName.value}.jpg';
      Reference storageReference =
          api.storage.ref().child('service_images/$imageName');
      final data1 = await imgFile.data;
      await storageReference.putData(data1!, metadata);
      path = await storageReference.getDownloadURL();
    }
    return ServiceInfo(
      serviceName: data.serviceName,
      description: data.description,
      serviceImageUrl: path,
    );
  }

  Future<List<ServiceInfo>> _addServicesImages(
      List<ServiceInfoAdd> data, DarziInfoBasic darzi) async {
    final servicesF = <Future<ServiceInfo>>[];

    for (var service in data) {
      servicesF.add(_addServiceImage(service, darzi));
    }
    final serviceList = <ServiceInfo>[];
    for (var f in servicesF) {
      final r = await f;
      serviceList.add(r);
    }
    return serviceList.toList();
  }

  Future<List<String>> _addOptionalImages(
      List<FileOrImgUrl> data, DarziInfoBasic darzi) async {
    final imagesF = <Future<String>>[];

    int count = 0;
    for (var image in data) {
      imagesF.add(_addOptinalImage(image, darzi, count));
      count++;
      if (count == 5) break;
    }
    final imageList = <String>[];
    for (var f in imagesF) {
      final r = await f;
      imageList.add(r);
    }
    return imageList.toList();
  }

  Future<String> _addOptinalImage(
      FileOrImgUrl data, DarziInfoBasic darzi, int count) async {
    if (data.isFile || data.isCroppedFile) {
      String imageName = '${darzi.uid}_$count.jpg';
      Reference storageReference =
          api.storage.ref().child('optional_images/$imageName');
      await storageReference.putData((await data.data)!, metadata);
      String downloadURL = await storageReference.getDownloadURL();
      return downloadURL;
    }
    return data.imgStringValue;
  }
}
