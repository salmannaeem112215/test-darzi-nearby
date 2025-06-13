// ignore_for_file: unnecessary_import, unused_import, prefer_const_constructors

import 'dart:io';

import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectAvatar extends StatelessWidget {
  const SelectAvatar({super.key, required this.setAvatar});

  final void Function(String avatar) setAvatar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Select Avatar",
          style: MyTextStyles.r24LightBrown,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            mainAxisExtent: 120,
          ),
          children: AvatarConfig.items
              .map((e) => GestureDetector(
                    onTap: () => _setAvatar(e),
                    child: Image.asset(
                      e,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  _setAvatar(String val) {
    Get.back();
    setAvatar(val);
  }
}

// class _UploadImages extends StatelessWidget {
//   const _UploadImages({
//     super.key,
//     required this.images,
//   });
//   final RxList<dynamic> images;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Row(
//             children: const [
//               Text.rich(TextSpan(
//                   text: 'Upload Up to 5 Pictures',
//                   style: MyTextStyles.r12Medium,
//                   children: [
//                     TextSpan(
//                         text: ' (Optional)',
//                         style: TextStyle(color: ColorConfig.gray))
//                   ])),
//               Icon(
//                 Icons.arrow_forward_ios_sharp,
//                 size: 16,
//               )
//             ],
//           ),
//           const SizedBox(height: 8),
//           MediaPicUploader(images: images),
//         ]));
//   }
// }
