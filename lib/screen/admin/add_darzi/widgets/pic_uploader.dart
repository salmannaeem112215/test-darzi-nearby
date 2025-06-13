import 'dart:io';

import 'package:darzi_nearby/app/utility/image_picker.dart';
import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:flutter_svg/svg.dart';

class PicUploader extends StatefulWidget {
  const PicUploader({
    super.key,
    required this.url,
    required this.size,
    required this.iconSize,
    required this.maxSize,
    this.onTap,
  });

  const PicUploader.profile({
    super.key,
    required this.url,
    this.onTap,
  })  : size = 110,
        maxSize = 1000,
        iconSize = 30;
  const PicUploader.service({
    super.key,
    required this.url,
    this.onTap,
  })  : size = 60,
        maxSize = 200,
        iconSize = 20;

  final Rx<FileOrImgUrl?> url;
  final double size;
  final double iconSize;
  final int? maxSize;
  final Function()? onTap;

  @override
  State<PicUploader> createState() => _PicUploaderState();
}

class _PicUploaderState extends State<PicUploader> {
  Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ??
          () async {
            final image = await MyImagePicker()
                .getImage(maxSize: widget.maxSize, context: context);
            if (image != null) {
              widget.url.value = FileOrImgUrl(image);
            }
          },
      child: Container(
          constraints: BoxConstraints(
            maxWidth: widget.size,
            maxHeight: widget.size,
            minHeight: widget.size,
            minWidth: widget.size,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
          child: Obx(() {
            final val = widget.url.value;
            if (val == null || val.isValid != null) return _uploadIcon;
            final dVal = val.value;
            if (AvatarConfig.isAvatar(val.imgStringValue)) {
              return Image.asset(
                val.imgStringValue,
                errorBuilder: (context, error, stackTrace) => _uploadIcon,
              );
            }
            if (dVal is ImageUrl) {
              return CachedNetworkImage(imageUrl: dVal.value);
            }
            if (dVal is File) {
              return Image.memory(dVal.readAsBytesSync());
            }
            if (dVal is CroppedFile) {
              if (bytes == null) {
                (dVal).readAsBytes().then((value) {
                  setState(() {
                    bytes = value;
                  });
                });
                return const CircularProgressIndicator();
              } else {
                return Image.memory(bytes!);
              }
            }
            return _uploadIcon;
          })),
    );
  }

  Widget get _uploadIcon {
    return Center(
      child: SvgPicture.asset(
        IconConfig.upload,
        height: widget.iconSize,
      ),
    );
  }
}
