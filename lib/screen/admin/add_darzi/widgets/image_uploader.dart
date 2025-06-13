import 'package:darzi_nearby/darzi_nearby.dart';

class ImageUploader extends StatelessWidget {
  const ImageUploader._({
    required this.url,
    required this.title,
    required this.subTitle,
    required this.isProfile,
    this.onTap,
  });
  const ImageUploader.profile(
    this.url, {
    super.key,
    this.onTap,
  })  : isProfile = true,
        title = 'Upload Darzi Image',
        subTitle = 'Please upload image in .JPEG format';
  const ImageUploader.service(
    this.url, {
    super.key,
    this.onTap,
  })  : isProfile = false,
        title = 'Upload Service Image',
        subTitle = 'Please upload image in .JPEG format';
  final Rx<FileOrImgUrl?> url;
  final String title;
  final String subTitle;
  final bool isProfile;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          isProfile
              ? PicUploader.profile(
                  url: url,
                  onTap: onTap,
                )
              : PicUploader.service(
                  url: url,
                  onTap: onTap,
                ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: FittedBox(
                  child: Text(
                    title,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                )),
                Flexible(
                    child: FittedBox(
                  child: Text(
                    subTitle,
                    style: const TextStyle(
                      color: ColorConfig.gray1,
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
