import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:darzi_nearby/screen/admin/add_darzi/widgets/upload_media_images.dart';

class DarziOptionalUploadImages extends StatelessWidget {
  const DarziOptionalUploadImages({
    super.key,
    required this.images,
  });
  final RxList<FileOrImgUrl> images;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(
            children: [
              Text.rich(TextSpan(
                  text: 'Upload Up to 5 Pictures',
                  style: MyTextStyles.r12Medium,
                  children: [
                    TextSpan(
                        text: ' (Optional)',
                        style: TextStyle(color: ColorConfig.gray))
                  ])),
              Icon(
                Icons.arrow_forward_ios_sharp,
                size: 16,
              )
            ],
          ),
          const SizedBox(height: 8),
          MediaPicUploader(images: images),
        ]));
  }
}
