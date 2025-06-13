// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:darzi_nearby/api/darzi_nearby_api.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class ServiceApi extends MyApi {
//   ServiceApi(super.api);

//   CollectionReference get coll => api.firestore.collection('services');
//   DocumentReference darziDoc(String uid) => coll.doc(uid);
//   CollectionReference<Map<String, dynamic>> darziServices(String uid) =>
//       darziDoc(uid).collection("services");

//   Future<void> addService(
//       String darziId, String serviceName, File imageFile) async {
//     try {
//       String imageName = '${darziId}_$serviceName.jpg';

//       // Upload the service image to Firebase Storage
//       String downloadURL = await uploadServiceImage(imageFile, imageName);

//       Map<String, dynamic> newService = {
//         ServiceInfoK.name: serviceName,
//         ServiceInfoK.serviceImgUrl: downloadURL,
//       };

//       await darziServices(darziId).add(newService);

//       ServerApiX.debugPrint('Service Added');
//     } catch (e) {
//       throw 'Error adding service: $e';
//     }
//   }

//   Future<void> removeService(String darziId, String serviceName) async {
//     try {
//       QuerySnapshot snapshot = await darziServices(darziId)
//           .where(ServiceInfoK.name, isEqualTo: serviceName)
//           .get();

//       if (snapshot.docs.isNotEmpty) {
//         DocumentReference serviceRef = snapshot.docs.first.reference;
//         await serviceRef.delete();
//       }

//       ServerApiX.debugPrint('Service Removed');
//     } catch (e) {
//       throw 'Error removing service: $e';
//     }
//   }

//   Future<void> updateServiceImage(
//       String darziId, String serviceName, File imageFile) async {
//     try {
//       String imageName = '${darziId}_$serviceName.jpg';

//       // Upload the updated service image to Firebase Storage
//       String downloadURL = await uploadServiceImage(imageFile, imageName);

//       QuerySnapshot snapshot = await darziServices(darziId)
//           .where(ServiceInfoK.name, isEqualTo: serviceName)
//           .get();

//       if (snapshot.docs.isNotEmpty) {
//         DocumentReference serviceRef = snapshot.docs.first.reference;
//         await serviceRef.update({
//           ServiceInfoK.serviceImgUrl: downloadURL,
//         });
//       }
//       ServerApiX.debugPrint('Service Updated');
//     } catch (e) {
//       throw 'Error updating service: $e';
//     }
//   }

//   Future<String> uploadServiceImage(File imageFile, String imageName) async {
//     try {
//       // Create a reference to the storage location where the image will be stored
//       Reference storageReference =
//           api.storage.ref().child('service_images/$imageName');

//       // Upload the image file to the storage location
//       UploadTask uploadTask = storageReference.putFile(imageFile);

//       // Get the download URL once the upload is complete
//       TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
//       String downloadURL = await taskSnapshot.ref.getDownloadURL();

//       return downloadURL;
//     } catch (e) {
//       throw 'Error uploading service image: $e';
//     }
//   }
// }
