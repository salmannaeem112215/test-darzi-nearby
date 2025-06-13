// ignore_for_file: use_build_context_synchronously

import 'package:darzi_nearby/darzi_nearby.dart';

class MyImagePicker {
  Future<CroppedFile?> getImage(
      {int? maxSize, required BuildContext context}) async {
    final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pic == null) return null;
    final croppedImage = await getImageCropper(
      context,
      pic.path,
    );
    return croppedImage;
  }

  Future<CroppedFile?> getImageCropper(BuildContext context, String path,
      {bool isCircle = true, int? maxSize}) async {
    return await ImageCropper().cropImage(
      sourcePath: path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      maxHeight: maxSize,
      maxWidth: maxSize,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );
  }

  Future<CroppedFile?> getDarziMediaImage({
    int? maxSize,
    required BuildContext context,
  }) async {
    final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pic == null) return null;
    final croppedImage = await getImageCropper(
      context,
      pic.path,
      maxSize: maxSize,
      isCircle: false,
    );

    return croppedImage;
  }
}
