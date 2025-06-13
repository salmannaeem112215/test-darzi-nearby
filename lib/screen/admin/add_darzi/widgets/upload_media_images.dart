import 'dart:io';

import 'package:darzi_nearby/app/utility/image_picker.dart';
import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:flutter_svg/svg.dart';

class MediaPicUploader extends StatefulWidget {
  const MediaPicUploader({
    super.key,
    required this.images,
  });

  final RxList<FileOrImgUrl> images;

  @override
  State<MediaPicUploader> createState() => _MediaPicUploaderState();
}

class _MediaPicUploaderState extends State<MediaPicUploader> {
  Uint8List? bytes;
  @override
  void initState() {
    super.initState();
  }

  void addImage(dynamic img) {
    widget.images.insert(widget.images.length, FileOrImgUrl(img));
  }

  void removeImage(dynamic val) {
    widget.images.remove(val);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      widget.images.length;
      if (widget.images.isEmpty) {
        return showUploadImage();
      }
      final pics = widget.images.map((element) => imgBox(element)).toList();
      if (pics.length < 5) {
        pics.add(imgBox(null));
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: pics,
        ),
      );
    });
  }

  Widget showUploadImage() {
    return GestureDetector(
      onTap: () async {
        final image =
            await MyImagePicker().getDarziMediaImage(context: context);
        if (image != null) {
          addImage(image);
        }
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 0)),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                IconConfig.upload,
                height: 25,
              ),
              const SizedBox(width: 16),
              const Text('Upload Picutres'),
            ],
          ),
        ),
      ),
    );
  }

  Widget imgBox(FileOrImgUrl? val) {
    return GestureDetector(
        onTap: val != null ? () => _removeImage(val) : _addImage,
        child: Container(
            height: 65,
            width: 65,
            margin: const EdgeInsets.only(right: 8),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: val != null ? _imgViwer(val) : _uploadIcon));
  }

  Widget _imgViwer(FileOrImgUrl val) {
    final img = val.value;
    if (img is ImageUrl) {
      return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: CachedNetworkImage(
          imageUrl: img.value,
          fit: BoxFit.cover,
        ),
      );
    } else {
      if (img is File) {
        return Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.memory(
            (val.value as File).readAsBytesSync(),
            fit: BoxFit.cover,
          ),
        );
      } else {
        img as CroppedFile;
        if (bytes == null) {
          img.readAsBytes().then((value) {
            setState(() {
              bytes = value;
            });
          });
          return const CircularProgressIndicator();
        } else {
          return Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.memory(
              bytes!,
              fit: BoxFit.cover,
            ),
          );
        }
      }
    }
  }

  void _removeImage(dynamic val) {
    Get.dialog(Dialog(
      backgroundColor: Colors.white,
      child: Stack(children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 36),
          child: OutlinedButton(
              onPressed: () {
                removeImage(val);
                Get.back();
              },
              child: const Text(
                'Remove Pic',
                style: TextStyle(color: Colors.black),
              )),
        ),
        Positioned(
          right: 0,
          child: IconButton(
              onPressed: Get.back, icon: const Icon(Icons.cancel_outlined)),
        )
      ]),
    ));
  }

  Future<void> _addImage() async {
    final image = await MyImagePicker().getDarziMediaImage(context: context);
    if (image != null) {
      addImage(image);
    }
  }

  Widget get _uploadIcon {
    return Center(
        child: SvgPicture.asset(
      IconConfig.upload,
      height: 24,
    ));
  }
}
